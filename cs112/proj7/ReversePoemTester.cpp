/* ReversePoemTester.cpp defines test-methods for the ReversePoem class methods
 *  Joel Adams, for CS 112 at Calvin College
 *  Student Name: Advait Scaria
 *  Date: 11/03/2018
 */

#include "ReversePoemTester.h"
#include <iostream>
#include <cassert>
using namespace std;

void ReversePoemTester::runTests() {
	cout << "Testing ReversePoem class..." << endl;
	testRPConstructor();
	cout << "All tests passed!" << endl;
}

void ReversePoemTester::testRPConstructor() {
	cout << "- Testing ReversePoem constructor... " << flush;

	// test first poem
	ReversePoem rp("poems/love.txt");
	assert( rp.getTitle() == "Love?" );
	cout << " 1a " << flush;

	assert( rp.getAuthor() == "Anonymous" );
	cout << " 1b " << flush;

	assert( rp.getBody() == "I don't love you anymore...\n"
							"I would be lying if I said\n"
							"That I still love you the way I always did.\n"
							"I'm sure\n"
							"Nothing was in vain.\n"
							"And I feel inside of me that\n"
							"You mean nothing to me\n"
							"I could never really say that\n"
							"Our time together matters.\n"
							"I feel more and more that\n"
							"I'm forgetting you...\n"
							"And I will never use the phrase\n"
							"I love you.\n"
							"I'm sorry but I must tell the truth.\n\n");
	cout << " 1c " << flush;

	assert( rp.getBodyReversed() == "\nI'm sorry but I must tell the truth.\n"
									"I love you.\n"
									"And I will never use the phrase\n"
									"I'm forgetting you...\n"
									"I feel more and more that\n"
									"Our time together matters.\n"
									"I could never really say that\n"
									"You mean nothing to me\n"
									"And I feel inside of me that\n"
									"Nothing was in vain.\n"
									"I'm sure\n"
									"That I still love you the way I always did.\n"
									"I would be lying if I said\n"
									"I don't love you anymore...\n");
	cout << " 1d " << flush;

	// test second poem
	ReversePoem rp2("poems/cats.txt");
	assert( rp2.getTitle() == "Cats" );
	cout << " 2a " << flush;

	assert( rp2.getAuthor() == "Leo J. Smada" );
	cout << " 2b " << flush;

	assert( rp2.getBody() == "I love it when cats rub against me.\n"
							 "I could never say\n"
							 "I hate those furry felines.\n\n");
	cout << " 2c " << flush;

	assert( rp2.getBodyReversed() == "\nI hate those furry felines.\n"
									 "I could never say\n"
									 "I love it when cats rub against me.\n");
	cout << " 2d " << flush;

	cout << " Passed!" << endl;
}

