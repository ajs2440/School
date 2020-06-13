/*
 * BSTGetHeight.cpp
 *
 *  Created on: Nov 26, 2018
 *      Author: ajs244
 */

#include "BSTGetHeight.h"
#include "BST.h"
#include <cassert>
#include <fstream>

void BSTGetHeight::run() {
	for(unsigned i = 0; i < 10; ++i) {
		cout << "\nEnter the name of the input file: " << flush;
		string fileName;
		cin >> fileName;

		ifstream fin(fileName.c_str());
		assert( fin.is_open() );

		BST<long> bst;
		long it;
		int duplicates = -1;

		while (!fin.eof()) {
			try {
				fin >> it;
				bst.insert(it);
			} catch (Exception& e) {
				++duplicates;
			}
		}

		fin.close();

		cout << "The height of the tree is " << bst.getHeight() << endl;
		cout << "There are " << duplicates << " duplicates." << endl;
	}
}
