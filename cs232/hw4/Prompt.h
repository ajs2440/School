/* Prompt.h - a class to represent the command-line prompt
 *
 * Written by:
 *    Josh Ridder (jmr59)
 *    Advait Scaria (ajs244)
 * Date: 3/13/20
 * 
 * For CS 232 at Calvin University
 */

#ifndef PROMPT_H_
#define PROMPT_H_

#include <iostream>
#include <stdlib.h>
#include <vector>
#include <string.h>
#include <unistd.h>
using namespace std;

class Prompt {
public:
    Prompt();
    string get() const;
  
private:
    char* cwd;      // private char* variable to store the path to the current working directory
};

#endif /*PROMPT_H_*/