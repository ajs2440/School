/*
 * main.cpp
 *
 *  Created on: Apr 6, 2020
 *      Author: ajs244
 */
#include "List.h"
#include <iostream>
using namespace std;

int main() {
	cout << "I am running!" << endl;
	List<double> aList; // 1
//	 cout << aList.getFirst();
//	aList.prepend(55); // 2
//	aList.prepend(44); // 3
//	aList.prepend(33); // 4
	cout << aList.getLast() << endl;
	cout << "I ended!" << endl;
}

