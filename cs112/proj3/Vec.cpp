/* Vec.cpp defines the methods for Vec, a simple vector class.
 *
 * Member 1: Advait Scaria
 * Date: 09/25/2018
 * Methods written: subscript (read version), operator!=(), readFrom(), operator-()
 *
 * Member 2: Joel C. Adams
 * Date: 09/29/2018
 * Methods written: subscript (write version), writeTo(), operator+(), operator*()
 *
 * Begun by: Joel C. Adams, for CS 112 at Calvin College.
 */
 
#include "Vec.h"
#include <stdexcept>
#include <iostream>
#include <fstream>
#include <cstring>
#include <string>
#include <cassert>

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
	if (index < 0 or index >= mySize) {
		throw range_error("Index out of range");
	} else { myArray[index] = it; }
}

Item Vec::getItem(unsigned index) const {
	if (index < 0 or index >= mySize) {
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


/* subscript (read version)...written by: Advait Scaria
 	 * @param index, an unsigned value.
 	 * Precondition: index < mySize
 	 * Return: myArray[index]
 	 */
const Item& Vec::operator[](unsigned index) const {
	if (index >= mySize) {
		throw range_error("Vec::operator[]: index is too large");
	} else { return myArray[index]; }
}

/* subscript (write version)...written by: Prof. Joel C. Adams
 	 * @param index, an unsigned value.
 	 * Precondition: index < mySize
 	 * Return: myArray[index]
 	 */
Item& Vec::operator[](unsigned index)  {
	if (index >= mySize) {
		throw range_error("Vec::operator[]: index is too large");
	} else { return myArray[index]; }
}

/* Vec inequality...written by: Advait Scaria
 	 * @param: v2, a Vec.
 	 * Precondition: 2 Vec objects needed for comparison
 	 * Return: a true or false bool
	 */
bool Vec::operator!=(const Vec& v2) const {
	if (mySize != v2.mySize) {
		return true;
	} else {
		for (unsigned i = 0; i < mySize; ++i) {
			if (myArray[i] != v2.myArray[i]) {
				return true;
			}
		}
	} return false;
}


/* read from file method......written by: Advait Scaria
      * @param: fileName, a string.
      * Precondition: a text file with corresponding fileName must exist
      * 			  with valid size and Item values inside that file
      * Postcondition: Vec object has within it initialized size and values from file
      */
void Vec::readFrom(const string& fileName) {
	delete [] myArray;
	ifstream fin (fileName.c_str());
	assert (fin.is_open());
	fin >> mySize;
	myArray = new Item[mySize];
	for (unsigned i = 0; i < mySize; ++i) {
		fin >> myArray[i];
	}
	fin.close();
}

/* file output method...written by: Prof. Joel C. Adams
 	 * @param: fileName, a string.
 	 * Precondition: fileName contains the name of an output file.
 	 * Postcondition: the first line of fileName contains mySize
 	 *                && the rest of my Items are in fileName,
 	 *                one per line.
 	 */
void Vec::writeTo(const string& fileName) const {
	ofstream fout (fileName.c_str());
	assert (fout.is_open());
	fout << mySize << "\n";
	for (unsigned i = 0; i < mySize; ++i) {
		fout << myArray[i] << "\n";
	}
	fout.close();
}

/* Vec addition...written by: Prof. Joel C. Adams
 	 * @param: v2, a Vec.
 	 * Precondition: mySize == v2.mySize.
 	 * Return: a Vec in which each Item[i]
 	 *          is the sum of me[i] + v2[i].
	 */
Vec Vec::operator+(const Vec& v2) const {
	if (mySize != v2.mySize) {
		throw length_error("Vec::operator+: lengths do not match");
	}

	Vec result(mySize);
	for (unsigned i = 0; i < mySize; ++i) {
		result.myArray[i] = myArray[i] + v2.myArray[i];
	}
	return result;
}

/* Vec addition...written by: Advait Scaria
 	 * @param: v2, a Vec.
 	 * Precondition: mySize == v2.mySize.
 	 * Return: a Vec in which each Item[i]
 	 *          is the difference of me[i] + v2[i].
	 */
Vec Vec::operator-(const Vec& v2) const {
	if (mySize != v2.mySize) {
		throw length_error("Vec::operator-: lengths do not match");
	}

	Vec result(mySize);
	for (unsigned i = 0; i < mySize; ++i) {
		result.myArray[i] = myArray[i] - v2.myArray[i];
	}
	return result;
}

/* Vec dot product...written by: Prof. Joel C. Adams
 	 * @param: v2, a Vec.
 	 * Precondition: mySize == v2.mySize.
 	 * Return:an Item which is the sum of
 	 *           me[i] * v2[i], for all i.
 	 */
Item Vec::operator*(const Vec& v2) const {
	if (mySize != v2.mySize) {
		throw length_error("Vec::operator*: lengths do not match");
	}
	Item result = Item(0);
	for (unsigned i = 0; i < mySize; ++i) {
		result += myArray[i] * v2.myArray[i];
	}
	return result;
}
