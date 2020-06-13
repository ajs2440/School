#include <cstddef>
#include <iostream>
using namespace std;

template<class Item>
class List {
public:
	List() { myFirst = NULL; mySize = 0; }
	unsigned getSize() const { return mySize; }
	void prepend(const Item& it) { myFirst = new Node(it, myFirst); mySize++;}
	Item getFirst() const { return myFirst->myItem; }
	Item getLast() const;
private:
	struct Node {
		Node(const Item& it, Node* nxt) { myItem = it; myNext = nxt; }
		Item myItem;
		Node* myNext;
	};
	Node* myFirst;
	unsigned mySize;
	friend class ListTester;
};

template<class Item>
Item List<Item>::getLast() const {
	if (mySize == 0) {
		cerr << "List is empty!" << endl;
		exit(1);
	} else {
		Node* nPtr = myFirst;
		while(nPtr) {
			if(nPtr->myNext == NULL) {
				return nPtr->myItem;
			} nPtr = nPtr->myNext;
		}
	}
}
