/* manageUserAccounts.cpp contains the "driver" for class AccountManager.
 * Joel Adams, for CS 112 at Calvin College.
 * Student: Advait Scaria
 * Date: 12/04/2018
 */

#include "AccountManager.h"

int main() {
	AccountManager manager("accountInfo.txt");
	manager.run();
}
