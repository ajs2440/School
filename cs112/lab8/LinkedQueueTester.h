/* LinkedQueueTester.h declares the class that tests class LinkedQueue.
 * Joel Adams, for CS 112 at Calvin College.
 * Student name: Advait Scaria
 * Date: 11/07/2018
 */

#ifndef LINKEDQUEUETESTER_H_
#define LINKEDQUEUETESTER_H_

#include "LinkedQueue.h"

class LinkedQueueTester {
public:
	void runTests();
	void testConstructor();
	void testAppend();
	void testRemove();
	void testCopyConstructor();
	void testAssignment();
};

#endif /*LINKEDQUEUETESTER_H_*/
