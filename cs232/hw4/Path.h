/* Path.h - a class to represent the directories in which JAShell searches for executable programs
 *
 * Written by:
 *    Josh Ridder (jmr59)
 *    Advait Scaria (ajs244)
 * Date: 3/13/20
 * 
 * For CS 232 at Calvin University
 */


#ifndef PATH_H_
#define PATH_H_

#include <iostream>
#include <stdlib.h>
#include <vector>
#include <string.h>
#include <dirent.h> 
using namespace std;

class Path {
public:
  Path();
  int find(const string& program) const;
  string getDirectory(int i) const;

private:
    char* env_var;                      // private variable to store the environment variable
    vector<char*> list_directories;     // vector of char* that stores the paths to different directories in 'PATH'
};

#endif /*PATH_H_*/