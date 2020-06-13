/* ReversePoem.h provides a ReversePoem class.
 * Joel Adams, for CS 112 at Calvin College.
 * Student Name: Advait Scaria
 * Date: 10/30/2018
 */

#ifndef REVERSEPOEM_H_
#define REVERSEPOEM_H_

#include "Stack.h"
#include "StackException.h"
#include <iostream>
#include <fstream>
using namespace std;

class ReversePoem {
public:
	ReversePoem(const string& fileName);

	string getTitle() const 			{return myTitle;}
	string getAuthor() const			{return myAuthor;}
	string getBody() const				{return myBody;}
	string getBodyReversed() const		{return myBodyReversed;}

private:
	string myTitle;
	string myAuthor;
	string myBody;
	string myBodyReversed;
};

#endif /* REVERSEPOEM_H_ */
