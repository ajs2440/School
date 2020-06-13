/* Stack.h provides a (dynamic-array-based) Stack class.
 * Joel Adams, for CS 112 at Calvin College.
 * Student Name: Advait Scaria
 * Date: 10/30/2018
 * 
 * Invariant: mySize == 0 && isEmpty() && !isFull()
 *         || mySize == myCapacity && !isEmpty() && isFull()
 *         || mySize > 0 && mySize < myCapacity && !isEmpty() && !isFull().
 * Notes: 
 * 1. Member mySize always contains the index of the next empty space in myArray
 *        (the index of the array element into which the next pushed item will be placed).
 * 2. Sending push() to a full Stack throws the exception Stack::Overflow.
 * 3. Sending pop() or peekTop() to an empty Stack throws the exception Stack::Underflow.
 */

#ifndef STACK_H_
#define STACK_H_

#include "StackException.h"
#include <string>
#include <iostream>
using namespace std;

template<class Item>

class Stack {
public:
	Stack(unsigned capacity);
	Stack(const Stack& original);
	~Stack();
	Stack& operator=(const Stack& original);
	bool isEmpty() const;
	bool isFull() const;
	Item peekTop() const;
	void push(const Item&);
	Item pop();
	
	unsigned getSize() 			{return mySize;}
	unsigned getCapacity() 		{return myCapacity;}
	void setCapacity(const unsigned& newCapacity);

protected:
	void makeCopyOf(const Stack& original);
	
private:
	unsigned myCapacity;
	unsigned mySize;
	Item*    myArray;
	friend class StackTester;
};

/* explicit-value constructor
 * Parameter: capacity, an unsigned value.
 * Precondition: capacity > 0.
 * Postcondition: mySize == 0 && myCapacity == capacity
 *              && myArray contains the address of a dynamic array of 'capacity' entries.
 */
template<class Item>
Stack<Item>::Stack(unsigned capacity) {
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
template<class Item>
Stack<Item>::Stack(const Stack& original) {
	makeCopyOf(original);
}

/* utility method containing code refactored from
 *  the copy constructor and operator=.
 * Parameter: original, a Stack (const reference).
 * Precondition: original.myCapacity > 0.
 * Postcondition: I am a copy of original.
 */
template<class Item>
void Stack<Item>::makeCopyOf(const Stack& original) {
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
template<class Item>
Stack<Item>::~Stack<Item>() {
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
template<class Item>
Stack<Item>& Stack<Item>::operator=(const Stack<Item>& original) {
	if (this != &original) {
		delete [] myArray;
		makeCopyOf(original);
	}
	return *this;
}

/* isEmpty()...written by Advait Scaria
 * Return: bool, returns true when Stack contains no items and false otherwise
 */
template<class Item>
bool Stack<Item>::isEmpty() const {
	return mySize == 0;
}

/* isFull()...written by Advait Scaria
 * Return: bool, returns true when Stack's size equals its capacity
 */
template<class Item>
bool Stack<Item>::isFull() const {
	return mySize == myCapacity;
}

/* peekTop()...written by Advait Scaria
 * Precondition: Stack must not be empty
 * Return: Item, returns the Item at the top of the Stack
 */
template<class Item>
Item Stack<Item>::peekTop() const {
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
template<class Item>
void Stack<Item>::push(const Item& it) {
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
template<class Item>
Item Stack<Item>::pop() {
	if (isEmpty()) {
		throw StackException ("pop()", "stack is empty");
	} else {
		mySize--;
		return myArray[mySize];
	}
}

/* setCapacity()...written by Advait Scaria
 * Precondition: Capacity is valid
 * Return: void
 * Postcondition: Sets myCapacity to newCapacity
 */
template<class Item>
void Stack<Item>::setCapacity(const unsigned& newCapacity) {
	if (newCapacity != myCapacity) {
		if (newCapacity < getSize()) {
			throw StackException ("setCapacity()", "newCapacity < original stack size");
		} else {
			Item* newArray = new Item[newCapacity];
			for (unsigned i = 0; i < getSize(); ++i) {
				newArray[i] = myArray[i];
			}
			delete [] myArray;
			myArray = newArray;
			myCapacity = newCapacity;
		}
	}
}


#endif

