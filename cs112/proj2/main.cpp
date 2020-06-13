/* main.cpp drives the testing of the array operations.
 * Student: Advait Scaria
 * Date: 09/18/2018
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 */
 
#include "ArrayTester.h"
#include <iostream>

int main() {
	ArrayTester at;
	at.runTests();

	double *a = new double[4];
	for (unsigned i = 0; i < 4; ++i) {
		cout << a[i] << endl;
	}
}
