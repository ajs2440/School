/* Vec.cpp defines the methods for Vec, a simple vector class.
 * Student: Advait Scaria
 * Date: 09/25/2018
 * Begun by: Joel C. Adams, for CS 112 at Calvin College.
 */
 
#include "Vec.h"
#include <stdexcept>
#include <iostream>
#include <fstream>

Vec::Vec() {
	mySize = 0;
	myArray = NULL;
}

Vec::Vec(unsigned size) {
	mySize = size;
	if (size > 0) {
		myArray = new Item[size]();
	} else {
		myArray = NULL;
	}
}

Vec::Vec(const Vec& original) {
	mySize = original.mySize;
	if (original.mySize > 0) {
		myArray = new Item[original.mySize]();
		for (unsigned i = 0; i < original.mySize; ++i) {
			myArray[i] = original.myArray[i];
		}
	} else { myArray = NULL; }
}

Vec::~Vec() {
	delete [] myArray;
	mySize = 0;
	myArray = NULL;
}

Vec& Vec::operator=(const Vec& original) {
	if (myArray == original.myArray && mySize == original.mySize) {
		mySize = original.mySize;
		myArray = original.myArray;
	} else {
		delete[] myArray;
		mySize = original.mySize;
		if (original.mySize > 0) {
			myArray = new Item[original.mySize]();
			for (unsigned i = 0; i < original.mySize; ++i) {
				myArray[i] = original.myArray[i];
			}
		} else { myArray = NULL; }
	}
    return *this;
}

unsigned Vec::getSize() const {
	return mySize;
}

void Vec::setItem(unsigned index, const Item& it) {
	if (mySize < 0 or index >= mySize) {
		throw range_error("Index out of range");
	} else { myArray[index] = it; }
}

Item Vec::getItem(unsigned index) const {
	if (mySize < 0 or index >= mySize) {
		throw range_error("Index out of range");
	} else { return myArray[index]; }
}

void Vec::setSize(unsigned newSize) {
	if (mySize != newSize) {
		if (newSize == 0) {
			delete [] myArray;
			myArray = NULL;
			mySize = 0;
		} else {
			Item * newArray = new Item[newSize]();
			if (mySize < newSize) {
				for (unsigned i = 0; i < mySize; ++i) {
					newArray[i] = myArray[i];
				}
			} else {
				for (unsigned i = 0; i < newSize; ++i) {
					newArray[i] = myArray[i];
				}
			} mySize = newSize;
			delete [] myArray;
			myArray = newArray;
		}
	}
}

bool Vec::operator==(const Vec& v2) {
	if (mySize != v2.mySize) {
		return false;
	} else {
		for (unsigned i = 0; i < mySize; ++i) {
			if (myArray[i] != v2.myArray[i]) {
				return false;
			}
		}
	}
	return true;
}

void Vec::writeTo(ostream& out) const {
	for (unsigned i = 0; i < mySize; ++i) {
		out << myArray[i] << endl;
	}
}

void Vec::readFrom(istream& in) {
	for (unsigned i = 0; i < mySize; ++i) {
		in >> myArray[i];
	}
}
