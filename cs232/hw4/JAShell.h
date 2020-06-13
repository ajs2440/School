/* JAShell.h details the functionality of the JAShell
 *
 * Written by:
 *    Josh Ridder (jmr59)
 *    Advait Scaria (ajs244)
 * Date: 3/13/20
 * 
 * For CS 232 at Calvin University
 */

#ifndef JASHELL_H_
#define JASHELL_H_
#include "Path.h"
#include "Prompt.h"
#include "CommandLine.h"
#include <string>
#include <sys/wait.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
using namespace std;

class JAShell {
public:
  JAShell();
  void run();
  int doPWD(Prompt* thePrompt);
  int doCD(string dir);
  int doSysCall(CommandLine* cl);
  int doExit();
private:
  Path *myPath;
};

#endif /*JASHELL_H_*/
