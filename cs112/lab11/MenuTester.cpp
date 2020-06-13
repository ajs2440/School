/* MenuTester.cpp defines test-methods for class Menu.
 * Joel Adams, for CS 112 at Calvin College.
 * Student: Advait Scaria
 * Date: 12/04/2018
 */

#include "MenuTester.h"
#include <cassert>

void MenuTester::runTests() {
	cout << "Testing the Menu class..." << endl;
	Menu m;
	assert( m.containsChoice('a') );
	assert( m.containsChoice('b') );
	assert( m.containsChoice('c') );
	assert( m.containsChoice('d') );
	assert( m.containsChoice('q') );
	assert( !m.containsChoice('e') );
	cout << "Passed!\n" << endl;
}

