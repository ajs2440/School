/* Matrix.cpp defines Matrix class methods.
 * Student Name: Advait Scaria
 * Date: 10/02/2018
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 */

#include "Matrix.h"

/* Matrix default constructor...written by: Advait Scaria
 	 * Postcondition: make sizes of myRows and myColumns zero
 	 */
Matrix::Matrix() {
	myRows = myColumns = 0;
}

/* Matrix explicit constructor...written by: Advait Scaria
 	 * @param: rows, columns -- both unsigned types
 	 * Postcondition: set sizes of myRows and myColumns to values passed in parameter
 	 * 				  loop through each row and set size of each Vec array in that row
 	 * 				  to the size of the columns passed in the parameter.
 	 */
Matrix::Matrix(unsigned rows, unsigned columns) {
	myRows = rows;
	myColumns = columns;
	myVec.setSize(rows);
	for (unsigned i = 0; i < rows; i++) {
		myVec[i].setSize(columns);
	}
}

/* Matrix getRows()...written by: Advait Scaria
 	 * Return: myRows, e.g. how many rows the Matrix has.
 	 */
unsigned Matrix::getRows() const {
	return myRows;
}

/* Matrix getColumns()...written by: Advait Scaria
 	 * Return: myColumns, e.g. how many columns the Matrix has.
 	 */
unsigned Matrix::getColumns() const {
	return myColumns;
}

/* Matrix subscript operator (read version)...written by: Advait Scaria
 	 * @param: index -- an unsigned type
 	 * Return: the Vec at the specific index of Matrix if index is valid without making
 	 * 		   any changes to that Vec
 	 */
const Vec<Item>& Matrix::operator[](unsigned index) const {
	if (index >= myRows) {
		throw range_error("Matrix::operator[]: index is too large");
	} else { return myVec[index]; }
}

/* Matrix subscript operator (write version)...written by: Advait Scaria
 	 * @param: index -- an unsigned type
 	 * Return: the Vec at the specific index of Matrix if index is valid to
 	 * 		   write Item values at that location
 	 */
Vec<Item>& Matrix::operator[](unsigned index) {
	if (index >= myRows) {
			throw range_error("Matrix::operator[]: index is too large");
	} else { return myVec[index]; }
}

/* Matrix == operator...written by: Advait Scaria
 	 * @param: m2 -- a Matrix
 	 * Return: compares 2 Matrices and returns true if they are the same, or false if
 	 * 		   they are different.
 	 */
bool Matrix::operator==(const Matrix& m2) const {
	if (myRows != m2.getRows() || myColumns != m2.getColumns()) {
		return false;
	} else {
		return myVec == m2.myVec;
	}
}
