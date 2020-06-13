/*
 * CS 232 Homework 6 - Busy Bakeshop
 * Name: Advait Scaria
 * Date: 04/10/20
 * 
 * 
*/

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <semaphore.h>
#include <pthread.h>

// Global semaphore variables
sem_t baker;        
sem_t cashier;      
sem_t store; 
sem_t loaf;
sem_t customerLine;
sem_t bill;  

// pthread_t identifiers
pthread_t bakerActions;
pthread_t cashierActions;
pthread_t customerActions[10];


/* 
 * bake() defines the actions of the baker when baking
 */
void *bake() {
    int totalBakedLoaves = 0;
    while(totalBakedLoaves != 10) {
        sem_wait(&baker);       // wait for baker to be available

        // baker makes a loaf of bread
        fprintf(stderr, "Baking loaf %d...\n", totalBakedLoaves + 1);
        totalBakedLoaves++;
        
        fprintf(stderr, "Loaf %d is available for sale!\n\n", totalBakedLoaves);
        sem_post(&loaf);
        usleep(1000000);        // delay in baking a loaf of bread 

        sem_post(&baker);       // release baker
        usleep(1000000);        // delay between baking of each loaf
    }
    fprintf(stderr, "\n-----------%d loaves baked, all baking is done!------------\n\n", totalBakedLoaves);
}

/*
 * cashierFunction() defines the actions of the baker when handling the cash register
 */
void *cashierFunction() {
    int receipts = 0;
    int val;
    while(receipts != 10) {         // as long as there are not ten receipts given yet
        sem_getvalue(&customerLine, &val);  // get value for the customerLine semaphore
        if(val > 0) {                       // if customerLine semaphore is greater than 0, then there are customers waiting at the cashier
            sem_wait(&baker);               // wait for baker to be free
            sem_wait(&customerLine);        // wait for customerLine to get released
            usleep(1000000);                // delay in processing payment
            // indicate the baker has handed the receipt to the customer
            fprintf(stderr, "\nBaker has printed and handed the receipt to the customer at the register\n\n");
            sem_post(&bill);                // release bill semaphore since the receipt has been handed               
            receipts++;                     // increment receipts
            sem_post(&baker);               // release baker
        }
    } fprintf(stderr, "\n---All loaves have been paid for, customers may be waiting for receipt---\n\n");
}

/*
 * customer() defines the actions of every customer
 */
void* customer(void *id_number) {
    int cust_number = (long)id_number;

    // customer waits outside until store has enough space
    fprintf(stderr, "Customer %d is waiting outside the store\n", cust_number);
    
    sem_wait(&store);           
    // customer enters store once store semaphore allows it
    fprintf(stderr, "Customer %d entered the store\n", cust_number);

    // customer waits for a loaf of bread to be available
    if (sem_wait(&loaf) == -1) {
        perror("sem_wait: &loaf"); exit(1);
    }

    // print message indicating when customer #x obtains loaf of bread
    fprintf(stderr, "Customer %d gets a loaf of bread\n", cust_number); 

    // wait for cashier to be free and indicate when customer #x has paid 
    sem_wait(&cashier);
    fprintf(stderr, "Customer %d has paid for the loaf of bread\n", cust_number);
    sem_post(&customerLine);    // release customerLine semaphore for other customers
    usleep(1000000);            // delay in getting receipt

    // wait on bill semaphore to get released (once baker hands receipt to this customer)
    sem_wait(&bill);
    // indicate when customer #x gets the receipt
    fprintf(stderr, "Customer %d has received the receipt for their loaf of bread\n", cust_number);
    
    sem_post(&cashier);         // release cashier once this customer is done


    // indicate when customer #x leaves the store
    fprintf(stderr, "---------------Customer %d has left the store---------------\n\n", cust_number);    

    sem_post(&store);           // exit the store creating space for another customer, if any
}

int main()
{
    // Print a message stating that the Bakery is starting up
    printf("\n------ Welcome! My Busy Bakeshop is just starting up! ------\n\n");

    // Create the necessary semaphores -- stored in global variables
    sem_init(&baker, 0, 1);
    sem_init(&cashier, 0, 1);
    sem_init(&store, 0, 5);         // 5 because there can only be 5 customers in store
    sem_init(&loaf, 0, 0);
    sem_init(&customerLine, 0, 0); 
    sem_init(&bill, 0, 0);          // 0 because this only gets a resource once the baker gives the receipt

    // Create the necessary threads -- the baker, the cashier, one for each customer
    pthread_create(&bakerActions, NULL, bake, NULL);
    pthread_create(&cashierActions, NULL, cashierFunction, NULL);

    for(long i = 1; i < 11; i++) {
        // code to set last customer's priority highest:
        // if (i == 10) {
        //     pthread_setschedprio(customerActions[9], 99);
        // }
        pthread_create(&customerActions[i], NULL, customer, (void *)i);
    }

    // Call pthread-exit(NULL) so that main program does not exit until all threads have exited
    pthread_exit(NULL);
}