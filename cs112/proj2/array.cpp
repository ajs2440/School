/* array.cpp defines "C style" array operations
 * Student: Advait Scaria
 * Date: 09/18/2018
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 */
 
#include "ArrayTester.h"
#include "array.h"
#include <iostream>
#include <fstream>
#include <sstream>
using namespace std;

/* array method...
      * @param: *a, a double dereference pointer
      * @size: an unsigned int
      * Precondition: size of array must be known
      * Postcondition: initializes the array of doubles to store natural numbers
      */
void initialize(double *a, unsigned size) {
	int val = 0;
	for (unsigned i = 0; i < size; i++) {
		val = i+1;
		a[i] = val;
	}
}

/* array method...
      * @param: *a, a double dereference pointer
      * @size: an unsigned int
      * Precondition: size of array must be known
      * Postcondition: output the values stored in the array of doubles
      */
void print(double *a, unsigned size) {
	for (unsigned i = 0; i < size; i++) {
		cout << *a << '\t';
		a++;
	}
}		

/* array method...
      * @param: *a, a double dereference pointer
      * @size: an unsigned int
      * @return: average, a double variable that gives the average value of the double array
      * Precondition: size of array must be known
      */
double average(double *a, unsigned size) {
	double average = 0;
	double sum = 0;
	for (unsigned i = 0; i < size; i++) {
		sum = sum + *a;
		a++;
	}
	average = sum/size;
	return average;
}

/* array method...
      * @param: *a, a double dereference pointer
      * @param: size, an int
      * @return: sum, a double variable that stores the sum of the values in the double array
      * Precondition: size of array must be known
      */
double sum(double *a, int size) {
	double sum = 0;
	for (int i = 0; i < size; i++) {
		sum = sum + *a;
		a++;
	}
	return sum;
}

/* array method...
      * @param: in, an input stream
      * @param: *a, a double dereference pointer
      * @param: size, an int
      * Precondition: size of array must be known
      * Postcondition: reads numbers from input stream, in, and stores them in a[]
      */
void read(istream& in, double *a, int size) {
	for (int i = 0; i < size; i++) {
		in >> *a;
		a++;
	}
}

/* array method...
      * @param: fileName, a string with the name of a file
      * @param: *&a, a double dereference pointer
      * @param: numValues, an int
      * Precondition: fileName must be known -- a corresponding file with integer values
      * 			  must be made
      * Postcondition: makes an array of size specified in first line of the file passed
      * 			   into the method and reads integer values from the next lines in the
      * 			   file to the array
      */
void fill(const string& fileName, double *&a, int &numValues) {
	// open ifstream to fileName
	ifstream inputFile(fileName.c_str());
	assert (inputFile.is_open());

	// read the first integer from file into numValues
	inputFile >> numValues;

	// dynamically allocate an array of numValues double values
	delete [] a;
	*&a = new double[numValues];

	// read numValues values from the file
	for (int i = 0; i < numValues; i++) {
		inputFile >> *&a[i];
	}

	// close the ifstream
	inputFile.close();
}

/* array method...
      * @param: *&a, a double dereference pointer
      * @param: oldSize, an int
      * @param: newSize, an int
      * Precondition: must have an array with values in it to copy
      * Postcondition: changes the size of array from oldSize to newSize
      */
void resize(double *&a, int oldSize, int newSize) {
	double *b = new double[newSize]();
	if (newSize > oldSize) {
		for (int i = 0; i < oldSize; i++) {
			b[i] = *&a[i];
		}
	} else if (newSize < oldSize) {
		for (int i = 0; i < newSize; i++) {
			b[i] = *&a[i];
		}
	} delete [] a;
	a = b;				// a points to the same location b points to
}

/* array method...
      * @param: *a1, a double dereference pointer
      * @param: size1, an int
      * @param: *a2, a double dereference pointer
      * @param: size2, an int
      * @param: *&a3, a double dereference pointer
      * @param: size3, an int
      * Precondition: must have two arrays with values declared to be copied
      * Postcondition: makes an array, *&a3, that contains the values of array, *a1,
      * 			   followed by the values of array, *a2
      */
void concat(double *a1, int size1, double *a2, int size2, double *&a3, int &size3) {
	// size3 equals size1 plus size2
	size3 = size1 + size2;
	double *b = new double[size3]();

	// loop through array b and add first array's values to b
	for (int i = 0; i < size1; i++) {
		b[i] = a1[i];
	}

	// make an int j, which starts at 0, to use as an index to copy down the second
	// array's values
	int j = 0;

	// loop through array b starting at size1 (where we left off copying array1's
	// values), loop until i is less than size3, and copy array2's values to b
	for (int i = size1; i < size3; i++) {
		b[i] = a2[j];
		j++;
	} delete [] a3;
	a3 = b;				// a3 points to the same location b points to
}


