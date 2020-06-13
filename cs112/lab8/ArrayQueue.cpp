/* ArrayQueue.cpp defines the methods for class ArrayQueue.
 * Joel Adams, for CS 112 at Calvin College.
 * Student name: Advait Scaria
 * Date: 11/07/2018
 */

#include "ArrayQueue.h"
#include <cstring>      // memcpy()
using namespace std;

/* ArrayQueue constructor
 * @param: capacity, unsigned.
 * Precondition: capacity must be positive.
 */
ArrayQueue::ArrayQueue(unsigned capacity) {
	if (capacity < 1) {
		throw QueueException ("ArrayQueue constructor", ": capacity not positive!");
	}
	myCapacity = capacity;
	mySize = myFirstIndex = 0;
	myLastIndex = capacity - 1;
	myArrayPtr = new Item[capacity];
}

/* copy constructor
 * @param: original, the ArrayQueue to be copied.
 * Postcondition: I am a deep copy of original.
 */
ArrayQueue::ArrayQueue(const ArrayQueue& original) {
	makeCopyOf(original);
}

/* utility method to build copies
 * @param: original, the ArrayQueue to be copied.
 * Postcondition: I am a deep copy of original.
 */
void ArrayQueue::makeCopyOf(const ArrayQueue& original) {
	mySize = original.mySize;
	myCapacity = original.myCapacity;
	myFirstIndex = original.myFirstIndex;
	myLastIndex = original.myLastIndex;
	myArrayPtr = new Item[myCapacity];
	memcpy(myArrayPtr, original.myArrayPtr, myCapacity*sizeof(Item) );
}

/* destructor
 * Postcondition: my dynamic array has been deallocated.
 */
ArrayQueue::~ArrayQueue() {
	delete [] myArrayPtr;
	myArrayPtr = NULL;
	mySize = myFirstIndex = myLastIndex = 0;
}
ArrayQueue 1 = ArrayQueue 2


/* assignment operator
 * @param: aQueue, an ArrayQueue/
 * @return: myself.
 * Postcondition: I am a deep copy of aQueue.
 */
ArrayQueue& ArrayQueue::operator=(const ArrayQueue& aQueue) {
	if (this != &aQueue) {
		delete [] myArrayPtr;
		makeCopyOf(aQueue);
	}
	return *this;
}

/* Am I empty?
 * @return: true if I am empty, false othewise.
 */
bool ArrayQueue::isEmpty() const {
	return mySize == 0;
}

/* Am I full?
 * @return: true if I am full, false othewise.
 */
bool ArrayQueue::isFull() const {
	return getSize() == myCapacity;
}

/* accessor for myCapacity
 * @return myCapacity.
 */
unsigned ArrayQueue::getCapacity() const {
	return myCapacity;
}

/* accessor for mySize
 * @return mySize.
 */
unsigned ArrayQueue::getSize() const {
	return mySize;
}

/* accessor for first item
 * @return item at myFirstIndex
 * Precondition: array must not be empty
 */
Item ArrayQueue::getFirst() const {
	if (isEmpty()) {
		throw EmptyQueueException ("ArrayQueue::getFirst() ");
	}
	return myArrayPtr[myFirstIndex];
}

/* accessor for last item
 * @return item at myLastIndex
 * Precondition: array must not be empty
 */
Item ArrayQueue::getLast() const {
	if (isEmpty()) {
		throw EmptyQueueException ("ArrayQueue::getLast() ");
	}
	return myArrayPtr[myLastIndex];
}

/* append()
 * @param: it, the Item to be appended
 * @return void
 * Precondition: array must not be full
 * Postcondition: it appended to array, mySize and myLastIndex updated
 */
void ArrayQueue::append(const Item& it) {
	if (isFull()) {
		throw FullQueueException ("ArrayQueue::append() ");
	}
	myLastIndex = (myLastIndex + 1) % myCapacity;
	myArrayPtr[myLastIndex] = it;
	++mySize;
}

/* remove()
 * @return result, the item at the head of the queue
 * Precondition: array must not be empty
 * Postcondition: mySize decremented and myFirstIndex updated
 */
Item ArrayQueue::remove() {
	if (isEmpty()) {
		throw EmptyQueueException ("ArrayQueue::remove() ");
	}
	Item result = myArrayPtr[myFirstIndex];
	myFirstIndex = (myFirstIndex + 1) % myCapacity;
	--mySize;
	return result;
}


