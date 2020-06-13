/* array.cpp defines "C style" array operations
 * Name: Advait Scaria
 * Date: 09/18/2018
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 */
 
#include "array.h"

/* array method...
      * @param: *a, a double dereference pointer
      * @size: an unsigned int
      * Precondition: size of array must be known
      * Postcondition: initializes the array of doubles to store natural numbers
      */
void initialize(double *a, unsigned size) {
	int val = 0;
	for (unsigned i = 0; i < size; i++) {
		val = i+1;
		a[i] = val;
	}
}

/* array method...
      * @param: *a, a double dereference pointer
      * @size: an unsigned int
      * Precondition: size of array must be known
      * Postcondition: output the values stored in the array of doubles
      */
void print(double *a, unsigned size) {
	for (unsigned i = 0; i < size; i++) {
		cout << *a << '\t';
		a++;
	}
}		

/* array method...
      * @param: *a, a double dereference pointer
      * @size: an unsigned int
      * @return: average, a double variable that gives the average value of the double array
      * Precondition: size of array must be known
      */
double average(double *a, unsigned size) {
	double average = 0;
	double sum = 0;
	for (unsigned i = 0; i < size; i++) {
		sum = sum + *a;
		a++;
	}
	average = sum/size;
	return average;
}

/* array method...
      * @param: *a, a double dereference pointer
      * @param: size, an int
      * @return: sum, a double variable that stores the sum of the values in the double array
      * Precondition: size of array must be known
      */
double sum(double *a, int size) {
	double sum;
	for (unsigned i = 0; i < size; i++) {
		sum = sum + *a;
		a++;
	}
	return sum;
}

/* array method...
      * @param: in, an input stream
      * @param: *a, a double dereference pointer
      * @param: size, an int
      * Precondition: size of array must be known
      * Postcondition:
      */
void read(istream& in, double *a, int size) {
	// ARE WE NOT SUPPOSED TO READ FIRST TWO VALUES IN ARRAY TXT FILE???
	// test method for read() has comments saying something like that
	for (unsigned i = 0; i < size; i++) {
		in >> *a;
		a++;
	}
}

void fill(const string& fileName, double *&a, int &numValues) {

}

void resize(double *&a, int oldSize, int newSize) {

}

void concat(double *a1, int size1, double *a2, int size2, double *&a3, int &size3) {

}

