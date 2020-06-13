/* CommandLine defines a class to read a command line
 *
 * Written by:
 *    Josh Ridder (jmr59)
 *    Advait Scaria (ajs244)
 * Date: 3/13/20
 * 
 * For CS 232 at Calvin University
 */


#include "CommandLine.h"

/* CommandLine constructor
 *    reads input from in, parses it, and allocates argc and argv instance variables
 */
CommandLine::CommandLine(istream &in)
{
  hasAmpersand = false;
  string tempString = "";
  getline(in, tempString);
  stringstream args(tempString);
  istream_iterator<string> begin(args);
  istream_iterator<string> end;
  vector<string> vstrings(begin, end);

  argc = vstrings.size();
  argv = (char**)calloc(argc, sizeof(char*));

  for (int i = 0; i < argc; i++)
  {
    if (strcmp(vstrings[i].c_str(), "&") == 0)
    {
      hasAmpersand = true;
    }
    else
    {
      argv[i] = new char[vstrings[i].size() + 1];
      for (int j = 0; j < vstrings[i].size(); j++)
      {
        argv[i][j] = vstrings[i][j];
      }
    }
  }
}
/* Params: int i
 * Returns the i-indexed element from argv
 * Throws an error if i is not a valid index in argv
 */
char* CommandLine::getArgVector(int i) const
{
  if (i >= argc)
  {
    throw out_of_range("Invalid range given to getArgVector: i must be less than argc.");
  }
  if (i < 0)
  {
    throw out_of_range("Invalid range give to getArgVector: i must not be negative.");
  }
  return argv[i];
}

/* Returns the private bool hasAmpersand, which is
 * properly initialized in CommandLine constructor
 * that reflects whether the user entered a "&"
 */
bool CommandLine::withAmpersand() const
{
  return hasAmpersand;
};

/* CommandLine destructor
 *    deallocates memory of CommandLine object
 */
CommandLine::~CommandLine()
{
  cout << "I'M DYING" << endl;
  for (int i = 0; i < argc; i++)
  {
    delete [] argv[i];
  }
  free(argv);
}