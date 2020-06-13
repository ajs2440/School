/* Matrix.h provides a class for manipulating 2-dimensional vectors.
 * Student Name: Advait Scaria
 * Date: 10/02/2018
 * Begun by: Joel Adams, for CS 112 at Calvin College.
 */

#ifndef MATRIX_H_
#define MATRIX_H_

#include "Vec.h"

template<class Item>

class Matrix {
public:
	Matrix();
	Matrix(unsigned rows, unsigned columns);
	unsigned getRows() const;
	unsigned getColumns() const;

	const Vec<Item>& operator[](unsigned index) const;
	Vec<Item>& operator[](unsigned index);
	bool operator==(const Matrix<Item>& m2) const;

	bool operator!=(const Matrix<Item>& m2) const;
	void readFrom(istream& cin);
	void writeTo(ostream& cout);
	void readFrom(const string& fileName);
	void writeTo(const string& fileName);
	Matrix<Item> operator+(const Matrix<Item>& m2) const;
	Matrix<Item> operator-(const Matrix<Item>& m2) const;
	Matrix<Item> getTranspose() const;

private:
	unsigned myRows;
	unsigned myColumns;
	Vec< Vec<Item> > myVec;

	friend class MatrixTester;
};

/* Matrix default constructor...written by: Advait Scaria
 	 * Postcondition: make sizes of myRows and myColumns zero
 	 */
template<class Item>
Matrix<Item>::Matrix() {
	myRows = myColumns = 0;
}

/* Matrix explicit constructor...written by: Advait Scaria
 	 * @param: rows, columns -- both unsigned types
 	 * Postcondition: set sizes of myRows and myColumns to values passed in parameter
 	 * 				  loop through each row and set size of each Vec array in that row
 	 * 				  to the size of the columns passed in the parameter.
 	 */
template<class Item>
Matrix<Item>::Matrix(unsigned rows, unsigned columns) {
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
template<class Item>
unsigned Matrix<Item>::getRows() const {
	return myRows;
}

/* Matrix getColumns()...written by: Advait Scaria
 	 * Return: myColumns, e.g. how many columns the Matrix has.
 	 */
template<class Item>
unsigned Matrix<Item>::getColumns() const {
	return myColumns;
}

/* Matrix subscript operator (read version)...written by: Advait Scaria
 	 * @param: index -- an unsigned type
 	 * Return: Vec<Item>, the Vec at the specific index of Matrix if index is valid without making
 	 * 		   any changes to that Vec.
 	 */
template<class Item>
const Vec<Item>& Matrix<Item>::operator[](unsigned index) const {
	if (index >= myRows) {
		throw range_error("Matrix::operator[]: index is too large");
	} else { return myVec[index]; }
}

/* Matrix subscript operator (write version)...written by: Advait Scaria
 	 * @param: index -- an unsigned type
 	 * Return: Vec<Item>, the Vec at the specific index of Matrix if index is valid to
 	 * 		   write Item values at that location.
 	 */
template<class Item>
Vec<Item>& Matrix<Item>::operator[](unsigned index) {
	if (index >= myRows) {
			throw range_error("Matrix::operator[]: index is too large");
	} else { return myVec[index]; }
}

/* Matrix == operator...written by: Advait Scaria
 	 * @param: m2 -- a Matrix
 	 * Return: bool, compares 2 Matrices and returns true if they are the same, or false if
 	 * 		   they are different.
 	 */
template<class Item>
bool Matrix<Item>::operator==(const Matrix<Item>& m2) const {
	if (myRows != m2.getRows() || myColumns != m2.getColumns()) {
		return false;
	} else {
		return myVec == m2.myVec;
	}
}

/* Matrix == operator...written by: Advait Scaria
 	 * @param: m2 -- a Matrix
 	 * Return: bool, compares 2 Matrices and returns true if they are not the same, or
 	 * 		   false if they are the same.
 	 */
template<class Item>
bool Matrix<Item>::operator!=(const Matrix<Item>& m2) const {
	if (myRows != m2.getRows() || myColumns != m2.getColumns()) {
		return true;
	} else {
		return myVec != m2.myVec;
	}
}


/* Matrix read from stream...written by: Advait Scaria
 	 * @param: cin, an istream
 	 * Precondition: Assumes that Matrix to which the message has been sent has already
 	 * 				 constructed with the correct size.
 	 * Return: void, Matrix is populated with items from input stream.
 	 */
template<class Item>
void Matrix<Item>::readFrom(istream& cin) {
	for (unsigned i = 0; i < myRows; i++) {
		for (unsigned j = 0; j < myColumns; j++) {
			cin >> myVec[i][j];
		}
	}
}

/* Matrix readFrom...written by: Jared Britton
 	 * @param: fileName, a string
     * Return: void, reads from a file and assigns values in Matrix at appropriate index
     */
template<class Item>
void Matrix<Item>::readFrom(const string& fileName) {
	ifstream fin(fileName.c_str());
	assert (fin.is_open());
	fin >> myRows >> myColumns;
	myVec.setSize(myRows);
	for (unsigned i = 0; i < myRows; i++) {
		myVec[i].setSize(myColumns);
		for (unsigned j = 0; j < myColumns; j++) {
			fin >> myVec[i][j];
		}
	}
	fin.close();
}

/* Matrix writeTo...written by: Jared Britton
 	 * @param: cout, an ostream
     * Return: void,  writes to ostream the matrix object it was assigned
     */
template<class Item>
void Matrix<Item>::writeTo(ostream& cout) {
	for (unsigned i = 0; i < myRows; i++) {
		for (unsigned j = 0; j < myColumns; j++) {
			cout << myVec[i][j] << '\t';
		}
	}
}

/* Matrix write to file...written by: Advait Scaria
 	 * @param: fileName, a string
 	 * Precondition: Assumes that Matrix to which this method has been used on already has
 	 * 				 initialized values.
 	 * Return: void, Output file is populated with items from Matrix.
 	 */
template<class Item>
void Matrix<Item>::writeTo(const string& fileName) {
	ofstream fout(fileName.c_str());
	assert (fout.is_open());
	fout << myRows << '\t' << myColumns << endl;
	for (unsigned i = 0; i < myRows; i++) {
		for (unsigned j = 0; j < myColumns; j++) {
			fout << myVec[i][j] << '\t';
		}
		fout << endl;
	}
	fout.close();
}

/* Matrix addition...written by: Advait Scaria
 	 * @param: m2, a Matrix
 	 * Precondition: two Matrices being summed should have same row and column sizes.
 	 * Return: Matrix<Item>, result Matrix which contains sum of two matrices.
 	 */
template<class Item>
Matrix<Item> Matrix<Item>::operator+(const Matrix<Item>& m2) const {
	if (myRows != m2.myRows or myColumns != m2.myColumns) {
		throw invalid_argument("Matrix::operator+: row or column lengths do not match");
	}
	Matrix<Item> result(myRows, myColumns);
	for (unsigned i = 0; i < myRows; i++) {
		for (unsigned j = 0; j < myColumns; j++) {
			result[i][j] = myVec[i][j] + m2[i][j];
		}
	}
	return result;
}

/* Matrix subtraction...written by: Jared Britton
 	 * @param: m2, a Matrix
 	 * Precondition: two Matrices being subtracted should have same row and column sizes.
 	 * Return: Matrix<Item>, A matrix where each instance of two matrices instances subtracted from one another
 	 */
template<class Item>
Matrix<Item> Matrix<Item>::operator-(const Matrix<Item>& m2) const {
	if (myRows != m2.myRows or myColumns != m2.myColumns) {
		throw invalid_argument("Matrix::operator-: row or column lengths do not match");
	}
	Matrix<Item> result(myRows, myColumns);
	for (unsigned i = 0; i < this->getRows(); i++) {
		for (unsigned j = 0; j < this->getColumns(); j++) {
			result[i][j] = myVec[i][j] - m2[i][j];
		}
	}
	return result;
}

/* Matrix transpose...written by: Jared Britton
 	 * Return: Matrix<Item>, result Matrix which is the transposed version of the matrix to which the
 	 * 		   message was passed to.
 	 */
template<class Item>
Matrix<Item> Matrix<Item>::getTranspose() const {
	Matrix<Item> result(myColumns, myRows);
	for (unsigned i = 0; i < myRows; i++) {
		for (unsigned j = 0; j < myColumns; j++) {
			result[j][i] = myVec[i][j];
		}
	}
	return result;
}

#endif
