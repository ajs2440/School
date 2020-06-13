/* tester.cpp drives the testing of our Vec class and runs an Application that uses Vec objects.
 * Student: Advait Scaria
 * Date: 09/25/2018
 * Begun by: Joel C. Adams, for CS 112 at Calvin College.
 */

#include "VecTester.h"
#include "Application.h"

int main() {
	VecTester vt;			// make a VecTester that tests Vec method
	vt.runTests();			// run the VecTester's tests methods

	Application x;			// make a Vec Application object and run it
	x.run();
}
