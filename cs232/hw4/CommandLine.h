/* CommandLine.h details the functionality of the CommandLine
 *
 * Written by:
 *    Josh Ridder (jmr59)
 *    Advait Scaria (ajs244)
 * Date: 3/13/20
 * 
 * For CS 232 at Calvin University
 */


#ifndef COMMANDLINE_H_
#define COMMANDLINE_H_
using namespace std;

#include "Prompt.h"
#include <iostream>
#include <sstream>
#include <string.h>
#include <iterator>
#include <vector>

class CommandLine {
public:
  CommandLine();
  CommandLine(istream& in);
  char* getCommand() const    {return argv[0];}
  int getArgCount() const     {return argc;}
  char** getArgVector() const {return argv;}
  char* getArgVector(int i) const;
  bool withAmpersand() const;

  ~CommandLine();

private:
  int argc;
  char** argv;
  bool hasAmpersand;
};

#endif /*COMMANDLINE_H_*/
