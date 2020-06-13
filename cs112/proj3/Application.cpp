/* Application.cpp defines the methods for Application objects.
 * Student: Advait Scaria
 * Date: 09/25/2018
 * Begun by: Joel C. Adams, for CS 112 at Calvin College.
 */

#include "Application.h"
#include "Vec.h"
#include <iostream>
using namespace std;

Application::Application() {
	// TODO Auto-generated constructor stub

}

Application::~Application() {
	// TODO Auto-generated destructor stub
}

/* Application run method......written by: Advait Scaria
      * runs the Vec Application where users can input their starting Vec point,
      * add details of more Vecs they want to use for navigation, and the Application
      * will calculate the user'sfinal point by outputting the sum of all the input
      * Vecs.
      */
void Application::run() {
	unsigned size;
	Item coordinate;
	Vec origin;
	Vec final;
	unsigned numOfVecs;

	cout << "\nWelcome to the Vec Application! \n";

	// defines number of dimensions, i.e. the size of the Vec objects
	cout << "\nEnter the number of dimensions: ";
	cin >> size;
	origin.setSize(size);
	cout << "\n";

	// defines the coordinates of the starting point, i.e. the Item values in the origin
	// Vec
	for (unsigned i = 0; i < origin.getSize(); ++i) {
		cout << "Enter coordinate " << i + 1 << " of the starting point: ";
		cin >> coordinate;
		origin.setItem(i, coordinate);
	}

	cout << "\nStarting point = {";
	for (unsigned i = 0; i < origin.getSize(); ++i) {
		if (origin.getSize() == 1) {
			cout << origin.getItem(0) << "}";
		} else if (i < origin.getSize() - 1) {
			cout << origin.getItem(i) << ", ";

		}
		if (i == origin.getSize() - 1) {
			cout << origin.getItem(i) << "}";
		}
	}

	// initialize final vector to be the same as origin vector so we can use final when
	// adding the vectors later on
	final = origin;


	// defines how many vectors user wants to use for the program
	cout << "\n";
	cout << "\nEnter number of vectors: ";
	cin >> numOfVecs;

	// defines the coordinates of the vectors user wants to use for the program and
	// calculates the sum of the vectors
	for (unsigned i = 0; i < numOfVecs; ++i) {
		cout << "\nEnter details of vector " << i + 1 << ": \n";
		Vec vector;
		vector.setSize(origin.getSize());
		for (unsigned j = 0; j < origin.getSize(); ++j) {
			cout << "\t Enter coordinate " << j + 1
					<< " of vector " << i + 1 << ": ";
			cin >> coordinate;
			vector.setItem(j, coordinate);
		}
		cout << "\n\t Vector " << i + 1 << " = {";
		for (unsigned i = 0; i < vector.getSize(); ++i) {
			if (vector.getSize() == 1) {
				cout << vector.getItem(0) << "}";
			} else if (i < vector.getSize() - 1) {
				cout << vector.getItem(i) << ", ";

			} if (i == vector.getSize() - 1) {
				cout << vector.getItem(i) << "}";
			}
		}
		cout << "\n";

		final = final + vector;
	}

	// displays the calculated coordinates/sum of the final vector
	cout << "\nFinal vector coordinates/Sum of starting point and vectors = {";
	for (unsigned i = 0; i < final.getSize(); ++i) {
		if (final.getSize() == 1) {
			cout << final.getItem(0) << "}";
		} else if (i < final.getSize() - 1) {
			cout << final.getItem(i) << ", ";

		} if (i == final.getSize() - 1) {
			cout << final.getItem(i) << "}\n";
		}
	}
}
