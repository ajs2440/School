/* Application.cpp defines the methods for Matrix-based Applications.
 * Student Name: Advait Scaria
 * Date: 10/06/2018
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 */

#include "Application.h"
#include "Matrix.h"
#include <iostream>
using namespace std;

Application::Application() {
	// TODO Auto-generated constructor stub

}

Application::~Application() {
	// TODO Auto-generated destructor stub
}

/* Application run method...written by: Advait Scaria
 	 * Return: void, runs the Matrix Application in console.
 	 */
void Application::run() {
	// int input variable to identify user input
	int input;

	// do while input is not 0 (which exits from the loop)
	do {
		cout << "\n\nWelcome to the Vec Application! \n" << "\nPlease enter: \n"
				<< "\t0 - to quit\n"
				<< "\t1 - to add two matrices\n"
				<< "\t2 - to subtract two matrices\n"
				<< "\t3 - to transpose two matrices\n" << " ---> ";

		// get input from user
		cin >> input;

		// appropriate variables instantiated to be used later on
		string inputFile1;
		string inputFile2;
		Matrix<double> m1;
		Matrix<double> m2;

		/* if input is 1, ask user for files containing two Matrix with double
		 * Items in them, make a sum Matrix that stores the sum at each point
		 * and print out the sum Matrix
		 */
		if (input == 1) {
			cout << "\nYou chose Addition.";
			cout << "\nEnter the name of the file containing Matrix 1 data: ";
			cin >> inputFile1;
			m1.readFrom(inputFile1);
			cout << "Matrix 1 is: {";
			for (unsigned i = 0; i < m1.getRows(); ++i) {
				for (unsigned j = 0; j < m1.getColumns(); ++j) {
					if (j == m1.getColumns() - 1) {
						if (i == m1.getRows() - 1) {
							cout << m1[i][j] << "}";
						} else {
							cout << m1[i][j] << "\n\t      ";
						}
					} else {
						cout << m1[i][j] << ", ";
					}
				}
			}

			cout << "\n\nEnter the name of the file containing Matrix 2 data: ";
			cin >> inputFile2;
			m2.readFrom(inputFile2);
			cout << "Matrix 2 is: {";
			for (unsigned i = 0; i < m2.getRows(); ++i) {
				for (unsigned j = 0; j < m2.getColumns(); ++j) {
					if (j == m2.getColumns() - 1) {
						if (i == m2.getRows() - 1) {
							cout << m2[i][j] << "}";
						} else {
							cout << m2[i][j] << "\n\t      ";
						}
					} else {
						cout << m2[i][j] << ", ";
					}
				}
			}

			Matrix<double> sum;
			sum = m1 + m2;
			cout << "\n\nSum of Matrix 1 and 2 is: {";
			for (unsigned i = 0; i < sum.getRows(); ++i) {
				for (unsigned j = 0; j < sum.getColumns(); ++j) {
					if (j == sum.getColumns() - 1) {
						if (i == sum.getRows() - 1) {
							cout << sum[i][j] << "}";
						} else {
							cout << sum[i][j] << "\n\t\t\t   ";
						}
					} else {
						cout << sum[i][j] << ", ";
					}
				}
			}
		}

		/* if input is 2, ask user for files containing two Matrix with double
				 * Items in them, make a difference Matrix that stores the difference
				 * at each point and print out the difference Matrix
				 */
		else if (input == 2) {
			cout << "\nYou chose Subtraction.";
			cout << "\nEnter the name of the file containing Matrix 1 data: ";
			cin >> inputFile1;
			m1.readFrom(inputFile1);
			cout << "Matrix 1 is: {";
			for (unsigned i = 0; i < m1.getRows(); ++i) {
				for (unsigned j = 0; j < m1.getColumns(); ++j) {
					if (j == m1.getColumns() - 1) {
						if (i == m1.getRows() - 1) {
							cout << m1[i][j] << "}";
						} else {
							cout << m1[i][j] << "\n\t      ";
						}
					} else {
						cout << m1[i][j] << ", ";
					}
				}
			}

			cout << "\n\nEnter the name of the file containing Matrix 2 data: ";
			cin >> inputFile2;
			m2.readFrom(inputFile2);
			cout << "Matrix 2 is: {";
			for (unsigned i = 0; i < m2.getRows(); ++i) {
				for (unsigned j = 0; j < m2.getColumns(); ++j) {
					if (j == m2.getColumns() - 1) {
						if (i == m2.getRows() - 1) {
							cout << m2[i][j] << "}";
						} else {
							cout << m2[i][j] << "\n\t      ";
						}
					} else {
						cout << m2[i][j] << ", ";
					}
				}
			}

			Matrix<double> diff;
			diff = m1 - m2;
			cout << "\n\nSum of Matrix 1 and 2 is: {";
			for (unsigned i = 0; i < diff.getRows(); ++i) {
				for (unsigned j = 0; j < diff.getColumns(); ++j) {
					if (j == diff.getColumns() - 1) {
						if (i == diff.getRows() - 1) {
							cout << diff[i][j] << "}";
						} else {
							cout << diff[i][j] << "\n\t\t\t   ";
						}
					} else {
						cout << diff[i][j] << ", ";
					}
				}
			}
		}

		/* if input is 3, ask user for files containing a Matrix with double
				 * Items in it, make a transpose Matrix that stores the transposed
				 * values at each point and print out the transpose Matrix
				 */
		else if (input == 3) {
			cout << "\nYou chose Transpose.";
			cout << "\nEnter the name of the file containing the Matrix data: ";
			cin >> inputFile1;
			m1.readFrom(inputFile1);
			cout << "Matrix is: {";
			for (unsigned i = 0; i < m1.getRows(); ++i) {
				for (unsigned j = 0; j < m1.getColumns(); ++j) {
					if (j == m1.getColumns() - 1) {
						if (i == m1.getRows() - 1) {
							cout << m1[i][j] << "}";
						} else {
							cout << m1[i][j] << "\n\t    ";
						}
					} else {
						cout << m1[i][j] << ", ";
					}
				}
			}

			Matrix<double> transpose = m1.getTranspose();
			cout << "\n\nTranspose of the Matrix is: {";
			for (unsigned i = 0; i < transpose.getRows(); ++i) {
				for (unsigned j = 0; j < transpose.getColumns(); ++j) {
					if (j == transpose.getColumns() - 1) {
						if (i == transpose.getRows() - 1) {
							cout << transpose[i][j] << "}";
						} else {
							cout << transpose[i][j] << "\n\t\t\t     ";
						}
					} else {
						cout << transpose[i][j] << ", ";
					}
				}
			}
		}
	} while (input != 0);

}
