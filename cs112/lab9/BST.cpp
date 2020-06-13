/* BST.cpp defines binary search tree methods.
 * Joel Adams, for CS 112 at Calvin College.
 * Student Name: Advait Scaria
 * Date: 11/20/2018
 */
 
#include "BST.h"

/* Default BST constructor
 * Postcondition: Initializes myRoot to NULL and myNumItems to 0
 */
BST::BST() {
	myRoot = NULL;
	myNumItems = 0;
}

BST::~BST() {
	delete myRoot;
	myRoot = NULL;
	myNumItems = 0;
}

BST::Node::Node(const Item& it) {
   myItem = it;
   myLeft = NULL;
   myRight = NULL;
}

BST::Node::~Node() {
	delete myLeft;
	delete myRight;
}

bool BST::isEmpty() const {
	return myNumItems == 0;
}

unsigned BST::getNumItems() const {
	return myNumItems;
}

/* BST::traversePreorder()
 * @return void
 * Postcondition: Invokes Node::traversePreorder if tree is not empty
 */
void BST::traversePreorder() {
	if ( !isEmpty() ) {
		myRoot->traversePreorder();
	}
}

/* Node::traversePreorder()
 * @return void
 * Postcondition: Outputs BST items to console in pre order (from top most nodes to bottom most nodes, left to right)
 */
void BST::Node::traversePreorder() {
	processItem();
	if (myLeft != NULL) {
		myLeft->traversePreorder();
	}
	if (myRight != NULL) {
		myRight->traversePreorder();
	}
}

/* BST::traversePostorder()
 * @return void
 * Postcondition: Invokes Node::traversePostorder if tree is not empty
 */
void BST::traversePostorder() {
	if ( !isEmpty() ) {
		myRoot->traversePostorder();
	}
}

/* Node::traversePostorder()
 * @return void
 * Postcondition: Outputs BST items to console in post order (from bottom most nodes to top most nodes, left to right)
 */
void BST::Node::traversePostorder() {
	if (myLeft != NULL) {
		myLeft->traversePostorder();
	}
	if (myRight != NULL) {
		myRight->traversePostorder();
	}
	processItem();
}

/* BST::traverseInorder()
 * @return void
 * Postcondition: Invokes Node::traverseInorder if tree is not empty
 */
void BST::traverseInorder() {
	if ( !isEmpty() ) {
		myRoot->traverseInorder();
	}
}

/* Node::traverseInorder()
 * @return void
 * Postcondition: Outputs BST items to console in order (from left most Nodes to right most Nodes)
 */
void BST::Node::traverseInorder() {
	if (myLeft != NULL) {
		myLeft->traverseInorder();
	}
	processItem();
	if (myRight != NULL) {
		myRight->traverseInorder();
	}
}

void BST::Node::processItem() {
		cout << ' ' << myItem;
}

/* Node::insert()
 * @param: it, Item
 * @return void
 * Precondition: Item should be valid and not already in the tree
 * Postcondition: Adds a new node with Item it into the correct position in the BST object
 */
void BST::Node::insert(const Item& it) {
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

/* BST::insert()
 * @param: it, Item
 * @return void
 * Postcondition: Adds a new node with Item it into BST
 */
void BST::insert(const Item& it) {
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
bool BST::Node::contains(const Item& it) {
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

/* BST::contains()
 * @param: it, Item
 * @return: bool, true if my BST contains Item it, false otherwise
 */
bool BST::contains(const Item& it) {
	if(isEmpty()) {
		return false;
	} else {
		myRoot->contains(it);
	}
}

