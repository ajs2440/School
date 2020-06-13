/* List.cpp defines List class methods.
 * Student Name: Advait Scaria
 * Date: 10/10/2018
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 */

#include "List.h"
#include <iostream>
#include <stdexcept>
using namespace std;

/* List default constructor...written by: Advait Scaria
 	 * Postcondition: initializes mySize to 0, myFirst and myLast to NULL
 	 */
List::List() {
	mySize = 0;
	myFirst = NULL;
	myLast = NULL;

}

void List::makeCopyOf(const List& original) {
	myFirst = myLast = NULL; //  set pointers
	mySize = 0; //   and size to 'empty' values
	if (original.getSize() > 0) {
		//  if there are nodes to copy:
		Node* oPtr = original.myFirst; //  start at the first node
		while (oPtr != NULL) {
			//  while there are more nodes:
			append(oPtr->myItem); //   append the item in that node
			oPtr = oPtr->myNext; //   advance to next node
		}
	}
}

/* List copy constructor...written by: Advait Scaria
 	 * Postcondition: makes a deep copy of the original list
 	 */
List::List(const List& original) {
	makeCopyOf(original);
}

/* List destructor...written by: Advait Scaria
 	 * Postcondition: deallocates memory after the use of a List
 	 */
List::~List() {
	delete myFirst; // delete first node, invoking ~Node() (does nothing if myFirst == NULL)
	myFirst = myLast = NULL; // clear myFirst and myLast (optional)
	mySize = 0;              // clear mySize (optional)
}

/* Node default constructor...written by: Advait Scaria
 	 * Postcondition: initializes myItem to 0 and myNext to NULL
 	 */
List::Node::Node() {
	myItem = 0;
	myNext = NULL;
}

/* Node explicit constructor...written by: Advait Scaria
 	 * @param: it, an Item and next, a Node pointer
 	 * Postcondition: initializes myItem to it and myNext to next
 	 */
List::Node::Node(const Item& it, Node* next) {
	myItem = it;
	myNext = next;
}

/* Node destructor...written by: Advait Scaria
 	 * Postcondition: deallocates memory after the use of Nodes
 	 */
List::Node::~Node() {
//	cout << "~Node() is deallocating the node containing item "
//	             << myItem << endl;
     delete myNext;       // delete the next node, invoking ~Node() in it
                          // (does nothing if myNext == NULL)
  }

/* List getSize method...written by: Advait Scaria
 	 * Return: unsigned mySize (returns the current size of the list)
 	 */
unsigned List::getSize() const {
	return mySize;
}

/* List getFirst method...written by: Advait Scaria
 	 * Return: Item myFirst->myItem (returns the first Item in the list)
 	 */
Item List::getFirst() const {
	if (mySize == 0 or myFirst == NULL) {
		throw underflow_error("getFirst() -- List is empty");
	}
	return myFirst->myItem;
}

/* List getLast method...written by: Advait Scaria
 	 * Return: Item myLast->myItem (returns the last Item in the list)
 	 */
Item List::getLast() const {
	if (mySize == 0 or myLast == NULL) {
		throw underflow_error("getLast() -- List is empty");
	}
	return myLast->myItem;
}

/* List append method...written by: Advait Scaria
 	 * @param: it, an Item
 	 * Return: void, makes a new Node with Item it, and adds it to the end of the list
 	 */
void List::append(const Item& it) {
	Node* nodePtr = new Node(it, NULL);
	if (mySize == 0 or myFirst == NULL) {
		myFirst = nodePtr;
	} else {
		myLast->myNext = nodePtr;
	} myLast = nodePtr;
	mySize = mySize + 1;
}

/* List equal method...written by: Advait Scaria
 	 * @param: original, a List
 	 * Return: List
 	 */
List& List::operator=(const List& original) {
	if (this->myFirst != original.myFirst) {
		this->~List();
		makeCopyOf(original);
	}
	return * this;
}
