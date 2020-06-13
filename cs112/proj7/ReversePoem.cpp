/* ReversePoem.cpp defines methods for ReversePoem objects
 *  Joel Adams, for CS 112 at Calvin College
 *  Student Name: Advait Scaria
 *  Date: 10/30/2018
 */
#include "ReversePoem.h"
#include <iostream>
#include <fstream>
#include <cassert>
using namespace std;

/* explicit ReversePoem constructor
 * Parameter: fileName, a string with name of poem text file
 * Precondition: file with fileName must exist and be formatted correctly
 * 				 (e.g. 1st line contains poem's title, 2nd line contains poem's author,
 * 				 3rd line is empty and 4th line to the end of file is the poem's body)
 * Postcondition: myTitle, myAuthor, myBody, and myBodyReversed initialized with values from poem file
 */
ReversePoem::ReversePoem(const string& fileName) {
	string emptyline;
	ifstream fin(fileName.c_str());
	assert( fin.is_open() );

	getline(fin, myTitle);			// get poem's title from first file line and store in myTitle
	getline(fin, myAuthor);			// get poem's author from first file line and store in myAuthor
	getline(fin, emptyline);		// read in empty line to emptyline variable

	Stack<string> poem(1);
	string line;
	while(fin) {
		try {
			getline(fin, line);							// try to read in line to stack
			poem.push(line);
		} catch (const StackException& se) {			// if stack full, double capacity and then read in line to stack
			poem.setCapacity(2*poem.getCapacity());
			getline(fin, line);
			poem.push(line);
		}
		string currentline = poem.pop();
		myBody = myBody + currentline + '\n';
		myBodyReversed = currentline + '\n' + myBodyReversed;
	}
	fin.close();
}
