/* LinkedQueue.cpp defines the methods for class LinkedQueue.
 * Joel Adams, for CS 112 at Calvin College.
 * Student name: Advait Scaria
 * Date: 11/07/2018
 */

#include "LinkedQueue.h"


/* LinkedQueue constructor
 * Postcondition: mySize = 0 & myFirstPtr, myLastPtr = NULL
 */
LinkedQueue::LinkedQueue() {
	mySize = 0;
	myFirstPtr = myLastPtr = NULL;
}

/* LinkedQueue copy constructor
 * @param: original, the LinkedQueue to be copied
 * Postcondition: I am a deep copy of the original
 */
LinkedQueue::LinkedQueue(const LinkedQueue& original) {
	makeCopyOf(original);
}

/* utility method to build copies
 * @param: original, the LinkedQueue to be copied.
 * Postcondition: I am a deep copy of original.
 */
void LinkedQueue::makeCopyOf(const LinkedQueue& original) {
	mySize = original.mySize;
	if ( mySize == 0 ) {
		myFirstPtr = myLastPtr = NULL;
	} else {
		myFirstPtr = new Node(original.getFirst(), NULL);
		Node * temp0 = original.myFirstPtr->myNextPtr;
		Node * temp1 = myFirstPtr;
		while (temp0 != NULL) {
			temp1->myNextPtr = new Node(temp0->myItem, NULL);
			temp1 = temp1->myNextPtr;
			temp0 = temp0->myNextPtr;
		}
		myLastPtr = temp1;
	}
}

/* destructor
 * Postcondition: my linked queue has been deallocated.
 */
LinkedQueue::~LinkedQueue() {
	delete myFirstPtr;
	myFirstPtr = myLastPtr = NULL;
	mySize = 0;
}

/* assignment operator
 * @param: aQueue, a LinkedQueue/
 * @return: myself.
 * Postcondition: I am a deep copy of aQueue.
 */
LinkedQueue& LinkedQueue::operator=(const LinkedQueue& aQueue) {
	if (this != &aQueue) {
		delete myFirstPtr;    // invokes recursive ~Node()
		makeCopyOf(aQueue);
	}
	return *this;
}

/* accessor for first item
 * @return item at myFirstPtr
 * Precondition: array must not be empty
 */
Item LinkedQueue::getFirst() const {
	if (isEmpty()) {
		throw EmptyQueueException("LinkedQueue::getFirst() ");
	}
	return myFirstPtr->myItem;
}

/* accessor for last item
 * @return item at myLastPtr
 * Precondition: array must not be empty
 */
Item LinkedQueue::getLast() const {
	if (isEmpty()) {
		throw EmptyQueueException("LinkedQueue::getLast() ");
	}
	return myLastPtr->myItem;
}

/* append()
 * @param: it, the Item to be appended
 * @return void
 * Precondition: array must not be full
 * Postcondition: it appended to array, mySize and myLastPtr updated
 */
void LinkedQueue::append(const Item& it) {
	try {
		Node* nPtr = new Node(it, NULL);
		if (isEmpty()) {
			myFirstPtr = nPtr;
		} else {
			myLastPtr->myNextPtr = nPtr;
		}
		myLastPtr = nPtr;
		++mySize;
	} catch (const bad_alloc& ba) {
		throw FullQueueException("LinkedQueue::append() ");
	}
}

/* remove()
 * @return result, the item at the head of the queue
 * Precondition: linked queue must not be empty
 * Postcondition: mySize decremented and myFirstPtr updated
 */
Item LinkedQueue::remove() {
	if (isEmpty()) {
		throw EmptyQueueException("LinkedQueue::remove() ");
	}
	Item result = myFirstPtr->myItem;
	Node* nPtr = myFirstPtr;
	myFirstPtr = myFirstPtr->myNextPtr;
	nPtr->myNextPtr = NULL;
	delete nPtr;
	--mySize;
	return result;
}
