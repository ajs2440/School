/* tester.cpp drives the testing of the Queue classes.
 * Joel Adams, for CS 112 at Calvin College.
 * Student name: Advait Scaria
 * Date: 11/07/2018
 */

 #include "ArrayQueueTester.h"
 #include "Palindrome.h"
 #include "PalindromeTester.h"

 int main() {
 	ArrayQueueTester aqt;
 	aqt.runTests();

 	PalindromeTester pdt;
 	pdt.runTests();

 	Palindrome pd0("palindromesornot.txt", "output0.txt");
 	Palindrome pd1("input.txt", "output.txt");
 }
 
 
