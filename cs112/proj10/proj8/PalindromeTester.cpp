/* PalindromeTester.cpp defines the test-methods for class Palindrome.
 * Joel Adams, for CS 112 at Calvin College.
 * Student name: Advait Scaria
 * Date: 11/19/2018
 */

#include "PalindromeTester.h"
#include "Palindrome.h"
#include <iostream>
using namespace std;

void PalindromeTester::runTests() {
	cout << "Testing class Palindrome..." << endl;
	testConstructor();
	testIsPalindrome();
	testDetectPalindrome();
	cout << "All tests passed!\n" << endl;
}

void PalindromeTester::testConstructor() {
	cout << "- testing constructor..." << flush;

	Palindrome pd("palindromesornot.txt", "output.txt");
	assert( pd.myInputFile ==  "palindromesornot.txt" );
	assert( pd.myOutputFile ==  "output.txt" );

	cout << " Passed! " << endl;
}

void PalindromeTester::testIsPalindrome() {
	cout << "- testing isPalindrome()..." << flush;

	Palindrome pd("testIsPalindrome.txt", "testIPOutput.txt");
	// empty case
	assert( !pd.isPalindrome("") );
	cout << " 0 " << flush;

	// single letter case
	assert( pd.isPalindrome("a") );
	cout << " 1 " << flush;

	// single word case
	assert( pd.isPalindrome("Racecar") );
	cout << " 2 " << flush;

	// non palindrome single word
	assert( !pd.isPalindrome("Computer") );
	cout << " 3 " << flush;

	// phrase (with punctuation)
	assert( pd.isPalindrome("Drawn Onward!") );
	cout << " 4 " << flush;

	// non palindrome phrase (with punctuation)
	assert( !pd.isPalindrome("Computer Science?") );
	cout << " 5 " << flush;

	cout << "Passed!" << endl;
}

void PalindromeTester::testDetectPalindrome() {
	cout << "- testing detectPalindrome()..." << flush;

	Palindrome pd("palindromesornot.txt", "output.txt");
	pd.detectPalindrome();
	ifstream fin("output.txt");
	string line = "";

	getline(fin, line);
	assert( line == "Drawn Onward ***" );
	cout << " 1a " << flush;

	getline(fin, line);
	assert( line == "The learned men of Rome could turn a palindrome but they were not the first." );
	cout << " 1b " << flush;

	getline(fin, line);
	assert( line == "Was it a car or a cat I saw ? ***" );
	cout << " 1c " << flush;

	getline(fin, line);
	assert( line == "Nani?" );
	cout << " 1d " << flush;

	getline(fin, line);
	assert( line == "Some men interpret nine memos. ***" );
	cout << " 1e " << flush;

	getline(fin, line);
	assert( line == "Lewd did I live, evil I did dwel. ***" );
	cout << " 1f " << flush;

	getline(fin, line);
	assert( line == "A man, a plan, a canal, Panama! ***" );
	cout << " 1g " << flush;

	getline(fin, line);
	assert( line == "What span, what palindromic bliss!" );
	cout << " 1h " << flush;

	cout << "Passed!" << endl;
}
