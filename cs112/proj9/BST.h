/* BST.h declares a "classic" binary search tree of linked nodes.
 * Joel Adams, for CS 112 at Calvin College.
 * Student Name: Advait Scaria
 * Date: 11/20/2018
 * 
 * Class Invariant:
 *   myNumItems == 0 && myRoot == NULL ||
 *   myNumItems > 0 && 
 *     myRoot stores the address of a Node containing an item &&
 *       all items in myRoot->myLeft are less than myRoot->myItem &&
 *       all items in myRoot->myRight are greater than myRoot->myItem.
 */

#ifndef BST_H_
#define BST_H_

#include "Exception.h"
#include "math.h"
#include <iostream>
using namespace std;

template<class Item>

class BST {
public:
	BST();
	virtual ~BST();
	bool isEmpty() const;
	unsigned getNumItems() const;

	void traverseInorder();
	void traversePreorder();
	void traversePostorder();

	void insert(const Item& it);
	bool contains(const Item& it);
	unsigned getHeight() const;

private:
	struct Node {
	    Node(const Item& it);
        virtual ~Node();

        void traverseInorder();
        void traversePreorder();
        void traversePostorder();
        virtual void processItem();

        unsigned getHeight() const;
		
        Item myItem;
        Node* myLeft;
        Node* myRight;

        void insert(const Item& it);
        bool contains(const Item& it);
	};
	
	Node* myRoot;
	unsigned myNumItems;
	friend class BST_Tester;
};

/* Default BST constructor
 * Postcondition: Initializes myRoot to NULL and myNumItems to 0
 */
template<class Item>
BST<Item>::BST() {
	myRoot = NULL;
	myNumItems = 0;
}

template<class Item>
BST<Item>::~BST() {
	delete myRoot;
	myRoot = NULL;
	myNumItems = 0;
}

template<class Item>
BST<Item>::Node::Node(const Item& it) {
   myItem = it;
   myLeft = NULL;
   myRight = NULL;
}

template<class Item>
BST<Item>::Node::~Node() {
	delete myLeft;
	delete myRight;
}

template<class Item>
bool BST<Item>::isEmpty() const {
	return myNumItems == 0;
}

template<class Item>
unsigned BST<Item>::getNumItems() const {
	return myNumItems;
}

/* BST<Item>::traversePreorder()
 * @return void
 * Postcondition: Invokes Node::traversePreorder if tree is not empty
 */
template<class Item>
void BST<Item>::traversePreorder() {
	if ( !isEmpty() ) {
		myRoot->traversePreorder();
	}
}

/* Node::traversePreorder()
 * @return void
 * Postcondition: Outputs BST items to console in pre order (from top most nodes to bottom most nodes, left to right)
 */
template<class Item>
void BST<Item>::Node::traversePreorder() {
	processItem();
	if (myLeft != NULL) {
		myLeft->traversePreorder();
	}
	if (myRight != NULL) {
		myRight->traversePreorder();
	}
}

/* BST<Item>::traversePostorder()
 * @return void
 * Postcondition: Invokes Node::traversePostorder if tree is not empty
 */
template<class Item>
void BST<Item>::traversePostorder() {
	if ( !isEmpty() ) {
		myRoot->traversePostorder();
	}
}

/* Node::traversePostorder()
 * @return void
 * Postcondition: Outputs BST items to console in post order (from bottom most nodes to top most nodes, left to right)
 */
template<class Item>
void BST<Item>::Node::traversePostorder() {
	if (myLeft != NULL) {
		myLeft->traversePostorder();
	}
	if (myRight != NULL) {
		myRight->traversePostorder();
	}
	processItem();
}

/* BST<Item>::traverseInorder()
 * @return void
 * Postcondition: Invokes Node::traverseInorder if tree is not empty
 */
template<class Item>
void BST<Item>::traverseInorder() {
	if ( !isEmpty() ) {
		myRoot->traverseInorder();
	}
}

/* Node::traverseInorder()
 * @return void
 * Postcondition: Outputs BST items to console in order (from left most Nodes to right most Nodes)
 */
template<class Item>
void BST<Item>::Node::traverseInorder() {
	if (myLeft != NULL) {
		myLeft->traverseInorder();
	}
	processItem();
	if (myRight != NULL) {
		myRight->traverseInorder();
	}
}

template<class Item>
void BST<Item>::Node::processItem() {
		cout << ' ' << myItem;
}

/* Node::insert()
 * @param: it, Item
 * @return void
 * Precondition: Item should be valid and not already in the tree
 * Postcondition: Adds a new node with Item it into the correct position in the BST object
 */
template<class Item>
void BST<Item>::Node::insert(const Item& it) {
	if(it < myItem) {
		if (myLeft == NULL) {
			myLeft = new Node(it);
		} else {
			myLeft->insert(it);
		}
	} else if(it > myItem) {
		if (myRight == NULL) {
			myRight = new Node(it);
		} else {
			myRight->insert(it);
		}
	} else {
		throw Exception("Node::insert(item): ", "item to insert is already in Binary Search Tree");
	}
}

/* BST<Item>::insert()
 * @param: it, Item
 * @return void
 * Postcondition: Adds a new node with Item it into BST
 */
template<class Item>
void BST<Item>::insert(const Item& it) {
	if(isEmpty()) {
		myRoot = new Node(it);
	} else {
		try {
			myRoot->insert(it);
		} catch (Exception& e) {
			throw Exception(e);
		}
	}
	myNumItems++;
}

/* Node::contains()
 * @param: it, Item
 * @return: bool, true if Item it is the same value as any item in any of my Nodes, false otherwise
 * Precondition: Item should be valid
 */
template<class Item>
bool BST<Item>::Node::contains(const Item& it) {
	if(it < myItem) {
		if (myLeft == NULL) {
			return false;
		} else {
			myLeft->contains(it);
		}
	} else if(it > myItem) {
		if (myRight == NULL) {
			return false;
		} else {
			myRight->contains(it);
		}
	} else {
		return true;
	}
}

/* BST<Item>::contains()
 * @param: it, Item
 * @return: bool, true if my BST contains Item it, false otherwise
 */
template<class Item>
bool BST<Item>::contains(const Item& it) {
	if(isEmpty()) {
		return false;
	} else {
		myRoot->contains(it);
	}
}

/* BST<Item>::getHeight()
 * @return: unsigned, returns my height
 */
template<class Item>
unsigned BST<Item>::getHeight() const {
	if(isEmpty()) {
		return 0;
	} else if(getNumItems() == 1) {
		return 1;
	} else if(getNumItems() == 2) {
		return 2;
	} else {
		return myRoot->getHeight();
	}
}

/* BST<Item>::Node::getHeight()
 * @return: unsigned, detects the longest path down the tree and returns its height
 */
template<class Item>
unsigned BST<Item>::Node::getHeight() const {
	if (myLeft == NULL && myRight == NULL) {
		return 1;
	} else if(myRight == NULL) {
		return myLeft->getHeight() + 1;
	} else if(myLeft == NULL) {
		return myRight->getHeight() + 1;
	} else {
		unsigned heightL = myLeft->getHeight() + 1;
		unsigned heightR = myRight->getHeight() + 1;
		if (heightL > heightR) {
			return heightL;
		} else {
			return heightR;
		}
	}
}

#endif /*BST_H_*/

