/* ArrayQueue.h declares a Queue class using a dynamic array.
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 * Student name: Advait Scaria
 * Date: 11/07/2018
 * 
 * Class Invariant: 
 *    mySize == 0 ||
 *    mySize > 0 && myArray[myFirst] == getFirst()
 *               && myArray[myLast] == getLast().
 * 
 *  (When I am not empty:
 *     myFirstIndex is the index of my oldest value;
 *     myLastIndex is the index of my newest value.)
 */

#ifndef ARRAY_QUEUE_H_
#define ARRAY_QUEUE_H_

#include "QueueException.h"
#include <cstring>      // memcpy()
using namespace std;

template<class Item>
 
class ArrayQueue {
public:
	ArrayQueue(unsigned capacity);
	ArrayQueue(const ArrayQueue& original);
	virtual ~ArrayQueue();
	ArrayQueue& operator=(const ArrayQueue& original);
	unsigned getSize() const;
	unsigned getCapacity() const;
	bool isEmpty() const;
	bool isFull() const;
	Item getFirst() const;
	Item getLast() const;
	void append(const Item& it);
	Item remove();
	void setCapacity(unsigned newCapacity);
protected:
	virtual void makeCopyOf(const ArrayQueue& original);
private:
	unsigned mySize;       // number of items I contain
	unsigned myCapacity;   // how many items I can store
	unsigned myFirstIndex; // index of oldest item (if any)
	unsigned myLastIndex;  // index of newest item (if any)
	Item*    myArrayPtr;   // dynamic array of items

	friend class ArrayQueueTester;
};

/* ArrayQueue constructor
 * @param: capacity, unsigned.
 * Precondition: capacity must be positive.
 */
template<class Item>
ArrayQueue<Item>::ArrayQueue(unsigned capacity) {
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
template<class Item>
ArrayQueue<Item>::ArrayQueue(const ArrayQueue<Item>& original) {
	makeCopyOf(original);
}

/* utility method to build copies
 * @param: original, the ArrayQueue to be copied.
 * Postcondition: I am a deep copy of original.
 */
template<class Item>
void ArrayQueue<Item>::makeCopyOf(const ArrayQueue<Item>& original) {
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
template<class Item>
ArrayQueue<Item>::~ArrayQueue() {
	delete [] myArrayPtr;
	myArrayPtr = NULL;
	mySize = myFirstIndex = myLastIndex = 0;
}

/* assignment operator
 * @param: aQueue, an ArrayQueue/
 * @return: myself.
 * Postcondition: I am a deep copy of aQueue.
 */
template<class Item>
ArrayQueue<Item>& ArrayQueue<Item>::operator=(const ArrayQueue<Item>& aQueue) {
	if (this != &aQueue) {
		delete [] myArrayPtr;
		makeCopyOf(aQueue);
	}
	return *this;
}

/* Am I empty?
 * @return: true if I am empty, false othewise.
 */
template<class Item>
bool ArrayQueue<Item>::isEmpty() const {
	return mySize == 0;
}

/* Am I full?
 * @return: true if I am full, false othewise.
 */
template<class Item>
bool ArrayQueue<Item>::isFull() const {
	return getSize() == myCapacity;
}

/* accessor for myCapacity
 * @return myCapacity.
 */
template<class Item>
unsigned ArrayQueue<Item>::getCapacity() const {
	return myCapacity;
}

/* accessor for mySize
 * @return mySize.
 */
template<class Item>
unsigned ArrayQueue<Item>::getSize() const {
	return mySize;
}

/* accessor for first item
 * @return item at myFirstIndex
 * Precondition: array must not be empty
 */
template<class Item>
Item ArrayQueue<Item>::getFirst() const {
	if (isEmpty()) {
		throw EmptyQueueException ("ArrayQueue::getFirst() ");
	}
	return myArrayPtr[myFirstIndex];
}

/* accessor for last item
 * @return item at myLastIndex
 * Precondition: array must not be empty
 */
template<class Item>
Item ArrayQueue<Item>::getLast() const {
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
template<class Item>
void ArrayQueue<Item>::append(const Item& it) {
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
template<class Item>
Item ArrayQueue<Item>::remove() {
	if (isEmpty()) {
		throw EmptyQueueException ("ArrayQueue::remove() ");
	}
	Item result = myArrayPtr[myFirstIndex];
	myFirstIndex = (myFirstIndex + 1) % myCapacity;
	--mySize;
	return result;
}

/* setCapacity()
 * @param: newCapacity, the unsigned new capacity of this queue
 * @return void
 * Precondition: newCapacity must not be zero or less than current size of this queue
 * Postcondition: myCapacity set to newCapacity so more items can be added to this queue
 */
template<class Item>
void ArrayQueue<Item>::setCapacity(unsigned newCapacity) {
	if (newCapacity == 0 || newCapacity < getSize()) {
		throw QueueException("ArrayQueue::setCapacity() ", "newCapacity is 0 or less than current queue size");
	} else if (newCapacity != myCapacity){
		Item* temp = new Item[newCapacity];
		unsigned size = getSize();
		for (unsigned i = 0; i < size; ++i) {
			temp[i] = remove();
		}
		delete [] myArrayPtr;
		myCapacity = newCapacity;
		mySize = size;
		myFirstIndex = 0;
		myLastIndex = mySize - 1;
		myArrayPtr = temp;
	}
}

#endif /*ARRAY_QUEUE_H_*/
