/* List.h provides a class for List structures that contain Nodes within them
 * Student Name: Advait Scaria
 * Date: 10/10/2018
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 */
#ifndef LIST_H_
#define LIST_H_

typedef double Item;

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

#endif /* LIST_H_ */
