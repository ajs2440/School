/* AccountManagerTester.h declares a test-class for class AccountManager.
 * Joel Adams, for CS 112 at Calvin College.
 * Student: Advait Scaria
 * Date: 12/04/2018
 */

#ifndef ACCOUNTMANAGERTESTER_H_
#define ACCOUNTMANAGERTESTER_H_

#include "AccountManager.h"
#include <iostream>
using namespace std;

class AccountManagerTester {
public:
   void runTests();
   void testCreateAndDelete();
   void testChangeUser();
   void testChangePassword();
};

#endif /*ACCOUNTMANAGERTESTER_H_*/

