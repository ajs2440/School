/* Stack.cpp defines the dynamically allocated (array-based ) Stack operations.
 * Joel Adams, for CS 112 at Calvin College.
 * Student Name: Advait Scaria
 * Date: 10/30/2018
 */

#include "Stack.h"

/* explicit-value constructor
 * Parameter: capacity, an unsigned value.
 * Precondition: capacity > 0.
 * Postcondition: mySize == 0 && myCapacity == capacity
 *              && myArray contains the address of a dynamic array of 'capacity' entries.
 */
Stack::Stack(unsigned capacity) {
	if (capacity == 0) {
		throw StackException ("Stack(size)", "size must be positive!");
	} else {
		mySize = 0;
		myCapacity = capacity;
		myArray = new Item[capacity];
	}
}

/* copy constructor
 * Parameter: original, a Stack (const reference).
 * Postcondition: I am a copy of original.
 */
Stack::Stack(const Stack& original) {
	makeCopyOf(original);
}

/* utility method containing code refactored from
 *  the copy constructor and operator=.
 * Parameter: original, a Stack (const reference).
 * Precondition: original.myCapacity > 0.
 * Postcondition: I am a copy of original.
 */
void Stack::makeCopyOf(const Stack& original) {
	myCapacity = original.myCapacity;
	myArray = new Item[myCapacity];

	for (unsigned i = 0; i < myCapacity; i++) {
		myArray[i] = original.myArray[i];
	}
	mySize = original.mySize;
}

/* destructor
 * Postcondition: myCapacity == 0 && mySize == 0
 *             && myArray has been deallocated.
 */
Stack::~Stack() {
	delete [] myArray;
	myArray = NULL;
	myCapacity = 0;
	mySize = 0;
}

/* assignment operator
 * Parameter: original, a Stack (const reference).
 * Postcondition: I am a copy of original
 *              && I have been returned.
 */
Stack& Stack::operator=(const Stack& original) {
	if (this != &original) {
		delete [] myArray;
		makeCopyOf(original);
	}
	return *this;
}

/* isEmpty()...written by Advait Scaria
 * Return: bool, returns true when Stack contains no items and false otherwise
 */
bool Stack::isEmpty() const {
	return mySize == 0;
}

/* isFull()...written by Advait Scaria
 * Return: bool, returns true when Stack's size equals its capacity
 */
bool Stack::isFull() const {
	return mySize == myCapacity;
}

/* peekTop()...written by Advait Scaria
 * Precondition: Stack must not be empty
 * Return: Item, returns the Item at the top of the Stack
 */
Item Stack::peekTop() const {
	if (isEmpty()) {
		throw StackException ("peekTop()", "stack is empty");
	} else {
		return myArray[mySize - 1];
	}
}

/* push()...written by Advait Scaria
 * @param: it, const Item
 * Precondition: valid Item it and myCapcity != mySize
 * Return: void, adds Item it at the end of the Stack
 */
void Stack::push(const Item& it) {
	if (myCapacity == mySize) {
		throw StackException ("push()" , "stack is full");
	} else {
		myArray[mySize] = it;
		mySize++;
	}

}

/* pop()...written by Advait Scaria
 * Precondition: Stack must not be empty
 * Return: Item, pops, or removes, the Item at the end of the Stack and returns it
 */
Item Stack::pop() {
	if (isEmpty()) {
		throw StackException ("pop()", "stack is empty");
	} else {
		mySize--;
		// how do we delete item at the end? set myArray[mySize] to 0?
		return myArray[mySize];
	}
}
