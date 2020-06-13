/* Vec.h provides a simple vector class named Vec.
 * Student: Advait Scaria
 * Date: 09/25/2018
 * Begun by: Joel C. Adams, for CS 112 at Calvin College.
 */

#ifndef VEC_H_
#define VEC_H_

#include <iostream>
#include <stdexcept>
#include <fstream>
#include <cstring>
#include <string>
#include <cassert>
using namespace std;

template<class Item>

class Vec {
public:
	Vec();
	Vec(unsigned size);
	Vec(const Vec& original);
	virtual ~Vec();

	Vec& operator=(const Vec& original);
	unsigned getSize() const;
	void setItem(unsigned index, const Item& it);
	Item getItem(unsigned index) const;
	void setSize(unsigned newSize);
	bool operator==(const Vec& v2) const;
	void writeTo(ostream& out) const;
	void readFrom(istream& in);

	const Item& operator[](unsigned index) const;
	Item& operator[](unsigned index);
	bool operator!=(const Vec& v2) const;
	void readFrom(const string& fileName);
	void writeTo(const string& fileName) const;
	Vec operator+(const Vec& v2) const;
	Vec operator-(const Vec& v2) const;
	Item operator*(const Vec& v2) const;

private:
	unsigned mySize;
	Item * myArray;

	friend class VecTester;
	friend class MatrixTester;
};

template<class Item>
Vec<Item>::Vec() {
	mySize = 0;
	myArray = NULL;
}

template<class Item>
Vec<Item>::Vec(unsigned size) {
	mySize = size;
	if (size > 0) {
		myArray = new Item[size]();
	} else {
		myArray = NULL;
	}
}

template<class Item>
Vec<Item>::Vec(const Vec<Item>& original) {
	mySize = original.mySize;
	if (original.mySize > 0) {
		myArray = new Item[original.mySize]();
		for (unsigned i = 0; i < original.mySize; ++i) {
			myArray[i] = original.myArray[i];
		}
	} else { myArray = NULL; }
}

template<class Item>
Vec<Item>::~Vec() {
	delete [] myArray;
	mySize = 0;
	myArray = NULL;
}

template<class Item>
Vec<Item>& Vec<Item>::operator=(const Vec<Item>& original) {
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

template<class Item>
unsigned Vec<Item>::getSize() const {
	return mySize;
}

template<class Item>
void Vec<Item>::setItem(unsigned index, const Item& it) {
	if (index < 0 or index >= mySize) {
		throw range_error("Index out of range");
	} else { myArray[index] = it; }
}

template<class Item>
Item Vec<Item>::getItem(unsigned index) const {
	if (index < 0 or index >= mySize) {
		throw range_error("Index out of range");
	} else { return myArray[index]; }
}

template<class Item>
void Vec<Item>::setSize(unsigned newSize) {
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

template<class Item>
bool Vec<Item>::operator==(const Vec<Item>& v2) const {
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

template<class Item>
void Vec<Item>::writeTo(ostream& out) const {
	for (unsigned i = 0; i < mySize; ++i) {
		out << myArray[i] << endl;
	}
}

template<class Item>
void Vec<Item>::readFrom(istream& in) {
	for (unsigned i = 0; i < mySize; ++i) {
		in >> myArray[i];
	}
}


/* subscript (read version)...written by: Advait Scaria
 	 * @param index, an unsigned value.
 	 * Precondition: index < mySize
 	 * Return: myArray[index]
 	 */
template<class Item>
const Item& Vec<Item>::operator[](unsigned index) const {
	if (index >= mySize) {
		throw range_error("Vec::operator[]: index is too large");
	} else { return myArray[index]; }
}

/* subscript (write version)...written by: Prof. Joel C. Adams
 	 * @param index, an unsigned value.
 	 * Precondition: index < mySize
 	 * Return: myArray[index]
 	 */
template<class Item>
Item& Vec<Item>::operator[](unsigned index)  {
	if (index >= mySize) {
		throw range_error("Vec::operator[]: index is too large");
	} else { return myArray[index]; }
}

/* Vec inequality...written by: Advait Scaria
 	 * @param: v2, a Vec.
 	 * Precondition: 2 Vec objects needed for comparison
 	 * Return: a true or false bool
	 */
template<class Item>
bool Vec<Item>::operator!=(const Vec<Item>& v2) const {
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
template<class Item>
void Vec<Item>::readFrom(const string& fileName) {
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
template<class Item>
void Vec<Item>::writeTo(const string& fileName) const {
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
template<class Item>
Vec<Item> Vec<Item>::operator+(const Vec<Item>& v2) const {
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
template<class Item>
Vec<Item> Vec<Item>::operator-(const Vec<Item>& v2) const {
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
template<class Item>
Item Vec<Item>::operator*(const Vec<Item>& v2) const {
	if (mySize != v2.mySize) {
		throw length_error("Vec::operator*: lengths do not match");
	}
	Item result = Item(0);
	for (unsigned i = 0; i < mySize; ++i) {
		result += myArray[i] * v2.myArray[i];
	}
	return result;
}


#endif /*VEC_H_*/
