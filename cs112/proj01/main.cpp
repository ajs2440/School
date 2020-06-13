/* main.cpp tests the classes in our project.
    * Student Name: Advait Scaria
    * Date: 09/11/2018
    * Begun by: Joel Adams, for CS 112 at Calvin College.
    */

#include "SongTester.h"
#include "PlayListTester.h"
#include "Application.h"
int main() {
	SongTester sTester;
	sTester.runTests();
	PlayListTester plTester;
	plTester.runTests();
	Application playListApp;
	playListApp.run();
}
