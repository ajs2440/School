/* ListTester.h declares the test-class for class List.
 * Member 1: Advait Scaria
 * Member 2: Alexander Johnson
 * Date: 10/10/2018
 * Joel Adams, for CS 112 at Calvin College.
 */

#ifndef LISTTESTER_H_
#define LISTTESTER_H_

class ListTester {
public:
    void runTests();
    void testDefaultConstructor();
    void testNodeDefaultConstructor();
    void testNodeExplicitConstructor();
    void testAppend();
    void testDestructor();
    void testCopyConstructor();
    void testAssignment();
    void testEquality();
    void testPrepend();
    void testInsert();
    void testReadFromStream();
    void testWriteToString();
    void testInequality();
    void testWriteToStream();
    void testReadFromString();
    void testGetIndexOf();
    void testRemove();
};

#endif /*LISTTESTER_H_*/
