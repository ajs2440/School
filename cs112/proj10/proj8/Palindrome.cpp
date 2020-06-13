/* Palindrome.cpp defines methods for the Palindrome detector class
 * Joel Adams, for CS 112 at Calvin College
 * Student Name: Advait Scaria
 * Date: 11/19/2018
 */

#include "Palindrome.h"

/* Palindrome constructor
 * @param: inputFile, string
 * @param: outputFile, string
 */
Palindrome::Palindrome(const string& inputFile, const string& outputFile) {
	myInputFile = inputFile;
	myOutputFile = outputFile;
	detectPalindrome();
}

/* detectPalindrome()
 * @return void
 * Precondition: inputFile must exist with valid string phrases
 * Postcondition: outputFile created classifying what are palindromes with "***"
 */
void Palindrome::detectPalindrome() {
	ifstream fin(myInputFile.c_str());
	assert ( fin.is_open() );
	ofstream fout (myOutputFile.c_str());
	assert ( fout.is_open() );

	string currentLine;
	while (!fin.eof()) {
		getline(fin, currentLine);
		if (isPalindrome(currentLine)) {
			fout << currentLine << " ***" << endl;
		} else {
			fout << currentLine << endl;
		}
	}

	fin.close();
	fout.close();
}

/* isPalindrome()
 * @param: str, string
 * @return bool, true or false
 * Precondition: str must be a valid string
 */
bool Palindrome::isPalindrome(const string& str) {
	if ((str.empty()) || (str.length() == 1 && (isspace(str[0]) || str == "\n"))) {
		return false;
	}
	Stack<char> myStack(1);
	ArrayQueue<char> myQueue(1);
	for (unsigned i = 0; i < str.length(); ++i) {
		if (isalpha(str[i]) && !(isspace(str[i]))) {
			try {
				myStack.push(tolower(str[i]));
			} catch (StackException& se) {
				myStack.setCapacity(myStack.getCapacity() * 2);
				myStack.push(tolower(str[i]));
			}
			try {
				myQueue.append(tolower(str[i]));
			} catch (QueueException& qe) {
				myQueue.setCapacity(myQueue.getCapacity() * 2);
				myQueue.append(tolower(str[i]));
			}
		}
	} while (!myStack.isEmpty()) {
		char ch1 = myStack.pop();
		char ch2 = myQueue.remove();
		if (ch1 != ch2) {
			return false;
		}
	}
	return true;
}

