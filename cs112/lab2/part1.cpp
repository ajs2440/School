/* part1.cpp
 * Name: Advait Scaria
 * Date: 09/18/2018
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 */
 
#include <iostream>
using namespace std;

int main() {
	long double   ldoubleVal;
	cout << "Address of ldoubleVal: " << &ldoubleVal << endl;
	double        doubleVal;
	cout << "Address of doubleVal: " << &doubleVal << endl;
	float         floatVal;
	cout << "Address of floatVal: " << &floatVal << endl;
	long          longVal;
	cout << "Address of longVal: " << &longVal << endl;
	int           intVal;
	cout << "Address of intVal: " << &intVal << endl;
	short         shortVal;
	cout << "Address of shortVal: " << &shortVal << endl;
	char          charVal1;
	cout << "Address of charVal1: " << static_cast<void*>(&charVal1) << endl;
	char          charVal2;
	cout << "Address of charVal2: " << static_cast<void*>(&charVal2) << endl;
	bool          boolVal;
	cout << "Address of boolVal: " << &boolVal << endl << endl;

	long double * ldPtr;
	cout << "Address of ldPtr: " << &ldPtr << endl;
	double *      dPtr;
	cout << "Address of dPtr: " << &dPtr << endl;
	float *       fPtr;
	cout << "Address of fPtr: " << &fPtr << endl;
	long *        lPtr;
	cout << "Address of lPtr: " << &lPtr << endl;
	int *         iPtr;
	cout << "Address of iPtr: " << &iPtr << endl;
	short *       sPtr;
	cout << "Address of sPtr: " << &sPtr << endl;
	char *        cPtr;
	cout << "Address of cPtr: " << &cPtr << endl;
	bool *        bPtr;
	cout << "Address of bPtr: " << &bPtr << endl;
}

