/* List.h provides a class for List structures that contain Nodes within them
 * Student: Advait Scaria
 * Date: 10/20/2018
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 */
#ifndef LIST_H_
#define LIST_H_

#include <iostream>
#include <fstream>
#include <stdexcept>
#include <cassert>
using namespace std;

template<class Item>

class List {
public:
    List();
    List(const List& original);
    virtual ~List();

    unsigned getSize() const;
    Item getFirst() const;
    Item getLast() const;
    void append(const Item& it);
    List& operator=(const List& original);
    bool operator==(const List& l2);
    void prepend(const Item& it);
    void insert(const Item& it, int index);
    void readFrom(istream& in);
    void writeTo(const string& fileName, char separator) const;
    bool operator!= (const List& l2);
    void writeTo(ostream& out, char separator) const;
    void readFrom(const string& fileName);
    int getIndexOf(const Item& num);
    Item remove(const Item& index);

    bool insertAfter(const Item& point,const Item& insert);
    bool insertBefore(const Item& point, const Item& insert);


private:
    struct Node {
        Node();
        Node(const Item& it, Node* next);
        ~Node();
        Item myItem;
        Node* myNext;
    };
    Node* myFirst;
    Node* myLast;
    unsigned mySize;

    void makeCopyOf(const List& original);

    friend class ListTester;
};

/*operator << method overwrite... written by: Advait Scaria
 * @param: out, an ostream
 * @param: list, a List
 * Return: ostream&, inserts items in list to ostream
 */
template<class Item>
ostream& operator<<(ostream& out, const List<Item>& list){
	list.writeTo(out, '=');
	return out;
}

/* List default constructor...written by: Advait Scaria
 	 * Postcondition: initializes mySize to 0, myFirst and myLast to NULL
 	 */
template<class Item>
List<Item>::List() {
	mySize = 0;
	myFirst = NULL;
	myLast = NULL;

}

template<class Item>
void List<Item>::makeCopyOf(const List& original) {
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
template<class Item>
List<Item>::List(const List& original) {
	makeCopyOf(original);
}

/* List destructor...written by: Advait Scaria
 	 * Postcondition: deallocates memory after the use of a List
 	 */
template<class Item>
List<Item>::~List() {
	delete myFirst; // delete first node, invoking ~Node() (does nothing if myFirst == NULL)
	myFirst = myLast = NULL; // clear myFirst and myLast (optional)
	mySize = 0;              // clear mySize (optional)
}

/* Node default constructor...written by: Advait Scaria
 	 * Postcondition: initializes myItem to 0 and myNext to NULL
 	 */
template<class Item>
List<Item>::Node::Node() {
	myItem = 0;
	myNext = NULL;
}

/* Node explicit constructor...written by: Advait Scaria
 	 * @param: it, an Item and next, a Node pointer
 	 * Postcondition: initializes myItem to it and myNext to next
 	 */
template<class Item>
List<Item>::Node::Node(const Item& it, Node* next) {
	myItem = it;
	myNext = next;
}

/* Node destructor...written by: Advait Scaria
 	 * Postcondition: deallocates memory after the use of Nodes
 	 */
template<class Item>
List<Item>::Node::~Node() {
//	cout << "~Node() is deallocating the node containing item "
//	             << myItem << endl;
     delete myNext;       // delete the next node, invoking ~Node() in it
                          // (does nothing if myNext == NULL)
  }

/* List getSize method...written by: Advait Scaria
 	 * Return: unsigned mySize (returns the current size of the list)
 	 */
template<class Item>
unsigned List<Item>::getSize() const {
	return mySize;
}

/* List getFirst method...written by: Advait Scaria
 	 * Return: Item myFirst->myItem (returns the first Item in the list)
 	 */
template<class Item>
Item List<Item>::getFirst() const {
	if (mySize == 0 or myFirst == NULL) {
		throw underflow_error("getFirst() -- List is empty");
	}
	return myFirst->myItem;
}

/* List getLast method...written by: Advait Scaria
 	 * Return: Item myLast->myItem (returns the last Item in the list)
 	 */
template<class Item>
Item List<Item>::getLast() const {
	if (mySize == 0 or myLast == NULL) {
		throw underflow_error("getLast() -- List is empty");
	}
	return myLast->myItem;
}

/* List append method...written by: Advait Scaria
 	 * @param: it, an Item
 	 * Return: void, makes a new Node with Item it, and adds it to the end of the list
 	 */
template<class Item>
void List<Item>::append(const Item& it) {
	Node* nodePtr = new Node(it, NULL);
	if (mySize == 0) {
		myFirst = nodePtr;
	} else {
		myLast->myNext = nodePtr;
	} myLast = nodePtr;
	mySize++;
}

/* List assignment method...written by: Advait Scaria
 	 * @param: original, a List
 	 * Return: List
 	 */
template<class Item>
List<Item>& List<Item>::operator=(const List<Item>& original) {
	if (myFirst != original.myFirst) {
		delete myFirst;
		makeCopyOf(original);
	}
	return * this;
}

/* List Equality operator...written by: Advait Scaria
 	 * @param: l2, a List
 	 * Return: bool, true if twominal input does not have "end": if c lists have the same size and Items, false otherwise
 	 */
template<class Item>
bool List<Item>::operator==(const List& l2) {
	if (mySize != l2.mySize) {
		return false;
	} else {
		Node* nPtr = myFirst;
		Node* nPtr2 = l2.myFirst;
		while (nPtr) {
			if (nPtr->myItem != nPtr2->myItem) {
				return false;
			} nPtr = nPtr->myNext;
			nPtr2 = nPtr2->myNext;
		}
	} return true;
}

/* List Inequality operator...written by: Alex Johnson
 * @param: l2, a List
 * Return: bool, true if two lists have the different sizes and Items, false otherwise
 */
template<class Item>
bool List<Item>::operator!=(const List& l2) {
    if (mySize != l2.mySize) {
        return true;
    } else {
        Node* nPtr = myFirst;
        Node* nPtr2 = l2.myFirst;
        while (nPtr) {
            if (nPtr->myItem != nPtr2->myItem) {
                return true;
            }
            nPtr = nPtr->myNext;
            nPtr2 = nPtr2->myNext;
        }
    }
    return false;
}

/* List prepend method...written by: Advait Scaria
 	 * @param: it, an Item
 	 * Return: void, adds a new Node at the beginning of the list
 	 */
template<class Item>
void List<Item>::prepend(const Item& it) {
	if (mySize == 0) {
		myFirst = myLast = new Node (it, NULL);
	} else {
		myFirst = new Node (it, myFirst);
	}
	mySize++;
}

/* List insert method...written by: Advait Scaria
 	 * @param: it, an Item
 	 * Return: void, inserts a Node with given Item at the given index of the list
 	 */
template<class Item>
void List<Item>::insert(const Item& it, int index) {
	if (index <= 0) {
		prepend(it);
	} else if (index >= mySize) {
		append(it);
	} else {
		int pointer = 0;
		Node* insrtNodePtr = new Node(it, NULL);
		Node* nPtr = myFirst;
		while (pointer != index - 1) {
			nPtr = nPtr->myNext;
			pointer++;
		} insrtNodePtr->myNext = nPtr->myNext;
		nPtr->myNext = insrtNodePtr;
		mySize++;
	}
}

/* List readFrom stream method...written by: Advait Scaria
 	 * @param: in, an istream
 	 * Return: void, reads from stream and initializes Items and Nodes of the List
 	 * 		   that the message is sent to
 	 */
template<class Item>
void List<Item>::readFrom(istream& in) {
	delete myFirst;
	Item it;
	while (in.peek() != '\n' and !in.eof()
			) {
		in >> it;
		append(it);

	}
}
/* List writeTo ...written by: Alex Johnson
 *@param: out, an ostream
 *Return: Void
 */
template<class Item>
void List<Item>::writeTo(ostream& out, char separator) const {
    Node* tempPtr = myFirst;
    while (tempPtr != NULL) {
    	if (tempPtr->myNext == NULL) {
    		out << tempPtr->myItem;
    	} else {
    		out << tempPtr->myItem << separator;
    	}
    	tempPtr = tempPtr->myNext;
    }

}

/*List readFrom(string) ...written by: Alex Johnson
 *@param: fileName, a string
 *Return: void
 */
template<class Item>
void List<Item>::readFrom(const string& fileName) {
    ifstream fin(fileName.c_str());
    assert(fin.is_open());
    Item it;
    while (fin) {
        fin >> it;
        append(it);
    }
    fin.close();
}

/* List writeTo(string) method...written by: Advait Scaria
 	 * @param: fileName, a string
 	 * Return: void, writes Items in the Nodes of the List that the message is sent to
 	 * 		   an output file
 	 */
template<class Item>
void List<Item>::writeTo(const string& fileName, char separator) const {
	ofstream fout(fileName.c_str());
	Node* nPtr = myFirst;
	while (nPtr) {
		fout << nPtr->myItem << separator;
		nPtr = nPtr->myNext;
	}
	fout.close();
}

/*List getIndexOf ... written by: Alex Johnson
 * @param:num, an Item
 * Return:Item
 */
template<class Item>
int List<Item>::getIndexOf(const Item& num) {
    int index = 0;
    for (Node* ptr = myFirst; ptr; ptr = ptr->myNext) {
        if (ptr->myItem == num) {
            return index;
        }
        index++;
    }
    return -1;
}

/*List remove... written by: Alex Johnson
 * @param:it, an Item
 * Return:Item
 */
template<class Item>
Item List<Item>::remove(const Item& index) {
    int num = 0;
    Item value;
    // Node* temp;
    for (Node* ptr = myFirst; ptr; ptr = ptr->myNext) {
        if (num == (index-1)) {
            value = ptr->myNext->myItem;
            ptr->myNext = ptr->myNext->myNext;
            return value;
        }
        num++;
    }
    return -1;
}

/*List insert before method... written by: Advait Scaria
 * @param: item1, an Item
 * @param: item2, an Item
 * @return: void
 * Postcondition: inserts insert Item before point Item in the list
 */
template<class Item>
bool List<Item>::insertBefore(const Item& point, const Item& insert) {
	if (mySize == 0) {
		return false;
	} else {
		Node* nPtr = new Node(insert, NULL);
		Node* lastNode = myFirst;
		Node* nextNode = myFirst;
		while (lastNode) {
			if (lastNode == myFirst && lastNode->myItem == point) {
				prepend(insert);
				return true;
			} else if (lastNode->myNext != NULL
					&& lastNode->myNext->myItem == point) {
				nextNode = lastNode->myNext;
				lastNode->myNext = nPtr;
				nPtr->myNext = nextNode;
				mySize++;
				return true;
			}
			lastNode = lastNode->myNext;
		}
	} return false;
}

/*List insert after method... written by: Advait Scaria
 * @param: item1, an Item
 * @param: item2, an Item
 * @return: void
 * Postcondition: inserts insert Item after point Item in the list
 */
template<class Item>
bool List<Item>::insertAfter(const Item& point,const Item& insert) {
	if (mySize == 0) {
		return false;
	} else {
		Node* nPtr = new Node(insert, NULL);
		Node* lastNode = myFirst;
		Node* nextNode = myFirst;
		while (lastNode) {
			if (lastNode->myItem == point) {
				nextNode = lastNode->myNext;
				lastNode->myNext = nPtr;
				nPtr->myNext = nextNode;
				mySize++;
				if (nextNode == NULL) {
					myLast = nPtr;
				}
				return true;
			} lastNode = lastNode->myNext;
		}
	} return false;
}

#endif /* LIST_H_ */
