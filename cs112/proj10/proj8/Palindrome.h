/* Palindrome.h provides a Palindrome detector class.
 * Joel Adams, for CS 112 at Calvin College.
 * Student Name: Advait Scaria
 * Date: 11/19/2018
 */

#ifndef PALINDROME_H_
#define PALINDROME_H_

#include "ArrayQueue.h"
#include "Stack.h"
#include <fstream>
#include <cassert>
#include <cctype>
using namespace std;

class Palindrome {
public:
	Palindrome(const string& inputFile, const string& outputFile);

	void detectPalindrome();
	bool isPalindrome(const string& str);
	void run();

private:
	string myInputFile;
	string myOutputFile;

	friend class PalindromeTester;
};

#endif /* PALINDROME_H_ */
