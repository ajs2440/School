/* ListTester.cpp defines the test methods for class List.
 * Member 1: Advait Scaria
 * Member 2: Alexander Johnson
 * Date: 10/10/2018
 * Joel Adams, for CS 112 at Calvin College.
 *
 * Tests written by Member 1 - Advait Scaria: testEquality(), testReadFromStream(),
 * 											  testWriteToString(),testPrepend(),
 * 											  testInsert(), testInsertAfter(),
 * 											  testInsertBefore(), testOutput()
 *
 * Tests written by Member 2 - Alex Johnson: testInequality(), testWriteToStream(),
 * 											 testReadFromString(), testGetIndexOf(),
 * 											 testRemove()
 */


#include "ListTester.h" // ListTester
#include "List.h"       // List
#include <iostream>     // cin, cout
#include <fstream>
#include <cassert>      // assert()
#include <cstdlib>      // exit()
#include <stdexcept>    // underflow_error
using namespace std;

void ListTester::runTests() {
	cout << "Running List tests..." << endl;
	testDefaultConstructor();
	testNodeDefaultConstructor();
	testNodeExplicitConstructor();
	testAppend();
	testDestructor();
	testCopyConstructor();
	testAssignment();
	testEquality();
	testInequality();
	testReadFromStream();
	testWriteToStream();
	testReadFromString();
	testWriteToString();
	testPrepend();
	testGetIndexOf();
	testInsert();
	testRemove();
	testInsertAfter();
	testInsertBefore();
	testOutput();
	cout << "All tests passed!" << endl;
}

void ListTester::testDefaultConstructor() {
	cout << "Testing List default constructor... " << flush;
	List<double> aList;
	assert( aList.mySize == 0 );
	assert( aList.myFirst == NULL );
	assert( aList.myLast == NULL );
	cout << "Passed!" << endl;
}

void ListTester::testNodeDefaultConstructor() {
	cout << "Testing Node default constructor... " << flush;
	List<double>::Node aNode;
	assert( aNode.myItem == double() );
	assert( aNode.myNext == NULL );
	cout << "Passed!" << endl;
}

void ListTester::testNodeExplicitConstructor() {
	cout << "Testing Node explicit constructor... " << flush;
	List<double>::Node n1(11, NULL);
	assert( n1.myItem == 11 );
	assert( n1.myNext == NULL );
	cout << " 1 " << flush;

	List<double>::Node *n3 = new List<double>::Node(33, NULL);
	List<double>::Node n2(22, n3);
	assert( n2.myItem == 22 );
	assert( n2.myNext == n3 );
	cout << " 2 " << flush;
	cout << "Passed!" << endl;
}

void ListTester::testAppend() {
	cout << "Testing append()... " << flush;
	// empty List
	List<double> aList;
	assert( aList.getSize() == 0 );
	assert( aList.myFirst == NULL );
	assert( aList.myLast == NULL );
	try {
		aList.getFirst();
		cerr << "getFirst() worked on empty list" << endl;
		exit(1);
	} catch (underflow_error&) {
		cout << " 0a " << flush;
	}
	try {
		aList.getLast();
		cerr << "getLast() worked on empty list" << endl;
		exit(1);
	} catch (underflow_error&) {
		cout << " 0b " << flush;
	}
	// append to empty list
	aList.append(11);
	assert( aList.getSize() == 1 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast == aList.myFirst );
	assert( aList.getFirst() == 11 );
	assert( aList.getLast() == 11 );
	assert( aList.myFirst->myNext == NULL );
	cout << " 1 " << flush;
	// append to a list containing 1 Item
	aList.append(22);
	assert( aList.getSize() == 2 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.myFirst != aList.myLast );
	assert( aList.getFirst() == 11 );
	assert( aList.getLast() == 22 );
	assert( aList.myFirst->myNext != NULL );
	assert( aList.myLast->myNext == NULL );
	cout << " 2 " << flush;
	// append to a list containing 2 Items
	aList.append(33);
	assert( aList.getSize() == 3 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.getFirst() == 11 );
	assert( aList.getLast() == 33 );
	assert( aList.myFirst->myNext->myItem == 22 );
	assert( aList.myLast->myNext == NULL );
	cout << " 3 " << flush;
	cout << "Passed!" << endl;
}

void ListTester::testDestructor() {
	cout << "Testing destructor... " << flush;
	List<double> aList;
	aList.~List();
	assert( aList.getSize() == 0 );
	assert( aList.myFirst == NULL );
	assert( aList.myLast == NULL );
	cout << " 1 " << flush;

	aList.append(11);
	aList.append(22);
	aList.append(33);
	aList.~List();
	assert( aList.getSize() == 0 );
	assert( aList.myFirst == NULL );
	assert( aList.myLast == NULL );
	cout << " 2 " << flush;
	cout << "Passed!  But double-check for memory leaks!" << endl;
}

void ListTester::testCopyConstructor() {
	cout << "Testing copy constructor... " << flush;
	// copy empty list
	List<double> list1;
	List<double> list2(list1);
	assert( list2.getSize() == 0 );
	assert( list2.myFirst == NULL );
	assert( list2.myLast == NULL );
	cout << " 1 " << flush;

	// copy nonempty list
	List<double> list3;
	list3.append(11);
	list3.append(22);
	list3.append(33);
	List<double> list4(list3);
	assert( list4.getSize() == 3 );
	assert( list4.getFirst() == 11 );
	assert( list4.getLast() == 33 );
	assert( list4.myFirst->myNext->myItem == 22 );
	assert( list4.myFirst != list3.myFirst );
	assert( list4.myLast != list3.myLast );
	cout << " 2 " << flush;
	cout << "Passed!" << endl;
}

void ListTester::testAssignment() {
	cout << "Testing assignment... " << flush;
	// empty to empty assignment
	List<double> list1;
	List<double> list2;
	list2 = list1;
	assert( list2.getSize() == 0 );
	assert( list2.myFirst == NULL );
	assert( list2.myLast == NULL );
	cout << " 1 " << flush;

	// non-empty to empty assignment
	List<double> list3;
	list3.append(11);
	list3.append(22);
	list3.append(33);
	List<double> list4;
	list4 = list3;
	assert( list4.getSize() == 3 );
	assert( list4.getFirst() == 11 );
	assert( list4.getLast() == 33 );
	assert( list4.myFirst->myNext->myItem == 22 );
      // check that nodes are distinct
	assert( list4.myFirst != list3.myFirst );
	assert( list4.myFirst->myNext != list3.myFirst->myNext );
	assert( list4.myLast != list3.myLast );
	cout << " 2 " << flush;

	// equal-sized non-empty to non-empty assignment
	List<double> list5;
	list5.append(44);
	list5.append(55);
	list5.append(66);
	list5 = list3;
	assert( list5.getSize() == 3 );
	assert( list5.getFirst() == 11 );
	assert( list5.getLast() == 33 );
	assert( list5.myFirst->myNext->myItem == 22 );
      // check that nodes are distinct
	assert( list5.myFirst != list3.myFirst );
	assert( list5.myFirst->myNext != list3.myFirst->myNext );
	assert( list5.myLast != list3.myLast );
	cout << " 3 " << flush;

	// empty to non-empty assignment
	List<double> list6;
	list6.append(44);
	list6.append(55);
	list6.append(66);
	List<double> list7;
	list6 = list7;
	assert( list6.getSize() == 0 );
	assert( list6.myFirst == NULL );
	assert( list6.myLast == NULL );
	cout << " 4 " << flush;

	// unequal-sized non-empty to non-empty assignment
	List<double> list8;
	list8.append(44);
	list8.append(55);
	list8.append(66);
	list8.append(77);
	list8 = list3;
	assert( list8.getSize() == 3 );
	assert( list8.getFirst() == 11 );
	assert( list8.getLast() == 33 );
	assert( list8.myFirst->myNext->myItem == 22 );
      // check that nodes are distinct
	assert( list8.myFirst != list3.myFirst );
	assert( list8.myFirst->myNext != list3.myFirst->myNext );
	assert( list8.myLast != list3.myLast );
	cout << " 5 " << flush;

	// assignment chaining
	List<double> list9;
	list9.append(44);
	list9.append(55);
	list9.append(66);
	list9.append(77);
	List<double> list10;
	list10 = list9 = list8;
	assert( list10.getSize() == 3 );
	assert( list10.getFirst() == 11 );
	assert( list10.getLast() == 33 );
	assert( list10.myFirst->myNext->myItem == 22 );
	cout << " 6 " << flush;

	// self-assignment (stupid, but possible)
	List<double> list11;
	list11.append(11);
	list11.append(22);
	list11.append(33);
	list11 = list11;
	assert( list11.getSize() == 3 );
	assert( list11.getFirst() == 11 );
	assert( list11.getLast() == 33 );
	assert( list11.myFirst->myNext->myItem == 22 );
	cout << " 7 " << flush;

	cout << "Passed!  But double-check for memory leaks!" << endl;
}

void ListTester::testEquality() {
	cout << "Testing equality... " << flush;

	List<double> list1;
	list1.append(11);
	list1.append(22);
	list1.append(33);

	List<double> list2;
	list2.append(11);
	list2.append(22);
	list2.append(33);

	List<double> list3;
	List<double> list4;

	List<double> list5;
	list5.append(1);
	list5.append(2);
	list5.append(3);

	List<double> list6;
	list6.append(11);
	list6.append(22);
	list6.append(33);
	list6.append(44);

	List<double> list7;
	list7.append(11);
	list7.append(1);
	list7.append(33);

	// empty to empty case
	assert( list3.getSize() == 0 );
	assert( list4.getSize() == 0 );
	assert( list3 == list4 );
	cout << " 1 " << flush;

	// non-empty to same non-empty case
	assert( list1.getSize() == list2.getSize() );
	assert( list1.getSize() > 0 );
	assert( list1 == list2 );
	cout << " 2 " << flush;

	// non-empty to empty case
	assert( list1.getSize() > 0 );
	assert( list3.getSize() == 0 );
	assert( !(list1 == list3) );
	cout << " 3 " << flush;

	// non-empty to different but same-sized non-empty case
	assert( list1.getSize() == list5.getSize() );
	assert( !(list1 == list5) );
	cout << " 4 " << flush;

	// non-empty to different non-empty with different size case
	assert( list1.getSize() != list6.getSize() );
	assert( !(list1 == list6) );
	cout << " 5 " << flush;

	// non-empty to different non-empty with same size case
	assert(list1.getSize() == list7.getSize());
	assert(!(list1 == list7));
	cout << " 6 " << flush;

	cout << "Passed!" << endl;
}

void ListTester::testInequality() {
    cout << "Testing inequality... " << flush;

    List<double> list1;

    List<double> list2;
    list2.append(1);

    List<double> list3;
    list3.append(2);

    List<double> list4;

    List<double> list5;
    list5.append(2);

    //Empty to non-empty case
    assert(list1.getSize() == 0);
    assert(list2.getSize() == 1);
    assert(list1 != list2);
    cout << " 1 " << flush;

    //Same size different Item
    assert(list3.getSize() == 1);
    assert(list2.getSize() == 1);
    assert(list3 != list2);
    cout << " 2 " << flush;

    //Empty to Empty
    assert(list1.getSize() == 0);
    assert(list4.getSize() == 0);
    assert(!(list1 != list4));
    cout << " 3 " << flush;

    //Same size same Item
    assert(list5.getSize() == 1);
    assert(list3.getSize() == 1);
    assert(!(list3 != list5));
    cout << " 4 " << flush;

    cout << " Passed " << endl;
}

void ListTester::testReadFromStream() {
	cout << "Testing readFrom(istream)... " << flush;
	// empty List
	List<double> aList;

	// read from ifstream
	ifstream in("StreamInput.txt");
	aList.readFrom(in);

	assert( aList.getSize() == 4 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.getFirst() == 1 );
	assert( aList.getLast() == 4 );
	assert( aList.myFirst->myNext->myItem == 2 );
	assert( aList.myFirst->myNext->myNext->myItem == 3 );
	assert( aList.myFirst->myNext->myNext->myNext->myItem == 4 );

	cout << "Passed!" << endl;
}

void ListTester::testWriteToStream() {
    cout << "Testing writeTo(stream)... " << flush;

    List<double> aList;
    aList.append(1);
    aList.append(2);
    aList.append(3);

    ofstream fout("ListFileOutputTest1.txt");
    assert(fout.is_open());
    aList.writeTo(fout, '\t');
    fout.close();

    List<double> list2;

    ifstream fin("ListFileOutputTest1.txt");
    list2.readFrom(fin);

    List<double>::Node* ptr2 = list2.myFirst;
    for (List<double>::Node* ptr = aList.myFirst; ptr; ptr = ptr->myNext) {
        assert(ptr->myItem == ptr2->myItem);
        ptr2 = ptr2->myNext;
    }
    cout << " Passed! " << endl;
}

void ListTester::testReadFromString() {
    cout << "Testing readFrom(string)... " << flush;

    List<double> aList;
    aList.readFrom("StreamInput.txt");

    List<double> list2;
    list2.append(1);
    list2.append(2);
    list2.append(3);
    list2.append(4);

    List<double>::Node* ptr2 = list2.myFirst;
    for (List<double>::Node* ptr = aList.myFirst; ptr2; ptr = ptr->myNext) {
        assert(ptr->myItem == ptr2->myItem);
        ptr2 = ptr2->myNext;
    }
    cout << " Passed! " << endl;
}

void ListTester::testWriteToString() {
	cout << "Testing writeTo(string)... " << flush;
	// empty List
	List<double> aList;
	aList.append(11);
	aList.append(22);
	aList.append(33);
	aList.append(44);

	aList.writeTo("WriteToFileTest1.txt", '\t');
	aList.writeTo("WriteToFileTest2.txt", '\n');

	// read from file in which Items are separated by tabs
	List<double> aList2;
	aList2.readFrom("WriteToFileTest1.txt");
	assert( aList2.getFirst() == 11 );
	assert( aList2.myFirst->myNext->myItem == 22 );
	assert( aList2.myFirst->myNext->myNext->myItem == 33 );
	assert( aList2.getLast() == 44 );

	// read from file in which Items are separated by lines
	List<double> aList3;
	aList2.readFrom("WriteToFileTest2.txt");
	assert( aList2.getFirst() == 11 );
	assert( aList2.myFirst->myNext->myItem == 22 );
	assert( aList2.myFirst->myNext->myNext->myItem == 33 );
	assert( aList2.getLast() == 44 );

	cout << "Passed!" << endl;
}

void ListTester::testPrepend() {
	cout << "Testing prepend()... " << flush;
	// empty List
	List<double> aList;
	assert( aList.getSize() == 0 );
	assert( aList.myFirst == NULL );
	assert( aList.myLast == NULL );

	// prepend to empty list
	aList.prepend(11);
	assert( aList.getSize() == 1 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast == aList.myFirst );
	assert( aList.getFirst() == 11 );
	assert( aList.getLast() == 11 );
	assert( aList.myFirst->myNext == NULL );
	cout << " 1 " << flush;
	// prepend to a list containing 1 Item
	aList.prepend(22);
	assert( aList.getSize() == 2 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.myFirst != aList.myLast );
	assert( aList.getFirst() == 22 );
	assert( aList.getLast() == 11 );
	assert( aList.myFirst->myNext != NULL );
	assert( aList.myLast->myNext == NULL );
	cout << " 2 " << flush;
	// prepend to a list containing 2 Items
	aList.prepend(33);
	assert( aList.getSize() == 3 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.getFirst() == 33 );
	assert( aList.getLast() == 11 );
	assert( aList.myFirst->myNext->myItem == 22 );
	assert( aList.myLast->myNext == NULL);
	cout << " 3 " << flush;
	cout << "Passed!" << endl;
}

void ListTester::testGetIndexOf() {
    cout << "Testing getIndexOf... " << flush;

    List<double> aList;
    aList.append(1);
    aList.append(2);
    aList.append(3);
    aList.append(4);
    aList.append(5);
    aList.append(6);
    aList.append(1);

    //Actual case
    assert(aList.getIndexOf(4) == 3);
    assert(aList.getIndexOf(5) == 4);

    cout << " 1 " << flush;

    //No index found
    assert(aList.getIndexOf(29) == -1);

    cout << " 2 " << flush;

    //Multiple cases
    assert(aList.getIndexOf(1) == 0);

    cout << " 3 " << flush;

    //Empty case
    List<double> list2;
    assert(list2.getIndexOf(29) == -1);

    cout << " 4 " << flush;

    cout << " Passed! " << endl;
}

void ListTester::testInsert() {
	cout << "Testing insert()... " << flush;
	// empty List
	List<double> aList;
	assert( aList.getSize() == 0 );
	assert( aList.myFirst == NULL );
	assert( aList.myLast == NULL );

	// insert to empty list
	aList.insert(11, 0);
	assert( aList.getSize() == 1 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast == aList.myFirst );
	assert( aList.getFirst() == 11 );
	assert( aList.getLast() == 11 );
	assert( aList.myFirst->myNext == NULL );
	assert( aList.myLast->myNext == NULL );
	cout << " 1 " << flush;
	// insert at negative index to a list containing 1 Item
	aList.insert(22, -2);
	assert( aList.getSize() == 2 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.myFirst != aList.myLast );
	assert( aList.getFirst() == 22 );
	assert( aList.getLast() == 11 );
	assert( aList.myFirst->myNext != NULL );
	assert( aList.myLast->myNext == NULL );
	cout << " 2 " << flush;
	// insert at an index greater than mySize to a list containing 2 Items
	aList.insert(33, 6);
	assert( aList.getSize() == 3 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.getFirst() == 22 );
	assert( aList.getLast() == 33 );
	assert( aList.myFirst->myNext->myItem == 11 );
	assert( aList.myLast->myNext == NULL);
	cout << " 3 " << flush;
	// insert at an index within size range to a list containing 3 Items
	aList.insert(44, 1);
	assert( aList.getSize() == 4 );
	assert( aList.myFirst != NULL );
	assert( aList.myLast != NULL );
	assert( aList.getFirst() == 22 );
	assert( aList.getLast() == 33 );
	assert( aList.myFirst->myNext->myItem == 44 );
	assert( aList.myFirst->myNext->myNext->myItem == 11 );
	assert( aList.myLast->myNext == NULL);
	cout << " 4 " << flush;

	cout << "Passed!" << endl;
}

void ListTester::testRemove() {
    cout << "Testing remove... " << flush;

    List<double> aList;
    aList.append(1);
    aList.append(2);
    aList.append(3);
    aList.append(4);
    aList.append(5);
    aList.append(6);
    aList.append(1);

    //Normal case
    assert(aList.getIndexOf(4) == 3);
    assert(aList.remove(2) == 3);
    assert(aList.getIndexOf(4) == 2);

    cout << " 1 " << flush;

    //Non-existent index
    assert(aList.remove(10) == -1);

    cout << " 2 " << flush;

    cout << " Passed! " << endl;
}

void ListTester::testInsertBefore() {
	cout << "Testing insertBefore()... " << flush;

	// insert before to empty List
	List<double> aList;
	assert( aList.getSize() == 0 );
	assert( aList.myFirst == NULL );
	assert( aList.myLast == NULL );
	assert( !aList.insertBefore(11, 22) );
	cout << " 0 " << flush;

	// insert before at the beginning of the list
	aList.append(22);
	assert( aList.getSize() == 1 );
	assert( aList.getFirst() == 22 );
	assert( aList.getLast() == 22 );
	assert (aList.insertBefore(22, 11));
	assert( aList.getSize() == 2 );
	assert( aList.getFirst() == 11 );
	assert( aList.getLast() == 22 );
	cout << " 1 " << flush;

	// insert before any item in between in a non-empty list
	aList.append(44);
	assert( aList.getSize() == 3 );
	assert( aList.getFirst() == 11 );
	assert( aList.getLast() == 44 );
	assert (aList.insertBefore(44, 33));
	assert( aList.getSize() == 4 );
	assert( aList.getFirst() == 11 );
	assert( aList.myFirst->myNext->myItem == 22 );
	assert( aList.myFirst->myNext->myNext->myItem == 33 );
	assert( aList.getLast() == 44 );
	cout << " 2 " << flush;

	// insert before the end of the list
	assert( aList.getSize() == 4 );
	assert( aList.getFirst() == 11 );
	assert( aList.getLast() == 44 );
	assert (aList.insertBefore(44, 40));
	assert( aList.getSize() == 5 );
	assert( aList.getFirst() == 11 );
	assert( aList.myFirst->myNext->myItem == 22 );
	assert( aList.myFirst->myNext->myNext->myItem == 33 );
	assert( aList.myFirst->myNext->myNext->myNext->myItem == 40 );
	assert( aList.getLast() == 44 );
	cout << " 3 " << flush;

	cout << "Passed!" << endl;
}

void ListTester::testInsertAfter() {
	cout << "Testing insertAfter()... " << flush;

	// insert after to empty List
	List<double> aList;
	assert( aList.getSize() == 0 );
	assert( aList.myFirst == NULL );
	assert( aList.myLast == NULL );
	assert( !aList.insertAfter(22, 11) );
	cout << " 0 " << flush;

	// insert after at the beginning of the list
	aList.append(11);
	assert( aList.getSize() == 1 );
	assert( aList.getFirst() == 11 );
	assert( aList.getLast() == 11 );
	assert (aList.insertAfter(11, 22));
	assert( aList.getSize() == 2 );
	assert( aList.getFirst() == 11 );
	assert( aList.getLast() == 22 );
	cout << " 1 " << flush;

	// insert after any item in between in a non-empty list
	aList.append(33);
	assert( aList.getSize() == 3 );
	assert( aList.getFirst() == 11 );
	assert( aList.getLast() == 33 );
	assert (aList.insertAfter(33, 44));
	assert( aList.getSize() == 4 );
	assert( aList.getFirst() == 11 );
	assert( aList.myFirst->myNext->myItem == 22 );
	assert( aList.myFirst->myNext->myNext->myItem == 33 );
	assert( aList.getLast() == 44 );
	cout << " 2 " << flush;

	// insert after the end of the list
	assert( aList.getSize() == 4 );
	assert( aList.getFirst() == 11 );
	assert( aList.getLast() == 44 );
	assert (aList.insertAfter(44, 55));
	assert( aList.getSize() == 5 );
	assert( aList.getFirst() == 11 );
	assert( aList.myFirst->myNext->myItem == 22 );
	assert( aList.myFirst->myNext->myNext->myItem == 33 );
	assert( aList.myFirst->myNext->myNext->myNext->myItem == 44 );
	assert( aList.getLast() == 55 );
	cout << " 3 " << flush;

	cout << "Passed!" << endl;
}

void ListTester::testOutput() {
	cout << "testOutput()... " << flush;
	ifstream fin("StreamInput.txt");
	assert (fin.is_open());

	// read items into aList from a file
	List<double> aList;
	aList.readFrom(fin);
	fin.close();

	// output items in aList to an output file stream
	ofstream fout("OperatorTest.txt");
	fout << aList;
	fout.close();

	// read from the output file and assert the conga line string in there is the same
	List<string> list2;
	list2.readFrom("OperatorTest.txt");
	assert (list2.getFirst() == "1=2=3=4");

	cout << "Passed!" << endl;
}

