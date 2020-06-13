/* Defines the functionality of the JAShell
 *
 * Written by:
 *    Josh Ridder (jmr59)
 *    Advait Scaria (ajs244)
 * Date: 3/13/20
 * 
 * For CS 232 at Calvin University
 */

#include "JAShell.h"

/* JAShell constructor
 *    initializes myPath private Path pointer variable to a new Path
 */
JAShell::JAShell()
{
  myPath = new Path();
}


/* JAShell::run()
 *    runs JAShell continuously:
 *      - prompting the user displaying the current path
 *      - reading in user command
 *      - execute user command if it has no error conditions
 *      - if com is initialiazed with an ampersand, run the command in the background
 *      - continues to prompt the user for next command
 */
void JAShell::run()
{

  int exit_val = 1;

  do
  {
    Prompt *thePrompt = new Prompt();
    cout << thePrompt->get() + "$ ";

    CommandLine* com = new CommandLine(cin);

    // handles pwd
    if (strcmp(com->getArgVector(0), "pwd") == 0)
    {
      exit_val = doPWD(thePrompt);
    }
    // handles cd
    else if (strcmp(com->getArgVector(0), "cd") == 0)
    {
      if (com->getArgCount() > 2)
      {
        cerr << "cd called with too many arguments, expected 2" << endl;
      }
      else if (com->getArgCount() < 2)
      {
        cerr << "cd called with too few arguments, expected 2" << endl;
      }
      else 
      {
        try
        {
          exit_val = doCD(com->getArgVector(1));
        }
        catch (invalid_argument e)
        {
          cerr << e.what() << endl;
        }
      }
    }
    // handles exit
    else if (strcmp(com->getArgVector(0), "exit") == 0)
    {
      exit_val = doExit();
    }
    // handles system calls
    else
    {
      exit_val = doSysCall(com);
    }

  } while (exit_val != 0);
}

/* doPWD()
 *   display current working directory 
 */
int JAShell::doPWD(Prompt *thePrompt)
{
  cout << thePrompt->get() << endl;
  return 1;
}

/* doCD()
 *   change working directory to specified directory 
 */
int JAShell::doCD(string dir)
{
  if (chdir(dir.c_str()) == -1)
  {
    throw invalid_argument("Invalid directory given to prompt");
  }
  return 1;
}

/* doSysCall()
 *   find path to the given command and execute it
 */
int JAShell::doSysCall(CommandLine *cl)
{

  int pid;
  int status;
  pid = fork();

  if (pid == 0)
  {
    char *path = new char();
    try {
      strcpy(path, (myPath->getDirectory(myPath->find(cl->getCommand())) + '/' +  cl->getCommand()).c_str());
      execve(path, cl->getArgVector(), environ);
    } catch(range_error e) {
      cerr << cl->getCommand() << ": command not found" << endl;
    }
  }
  else if (pid > 0) 
  {
    if (!cl->withAmpersand()){
      waitpid(pid, &status, 0);      
    }
  }
  else
  {
    throw runtime_error("Fork failed.");
  }
  return 1;
}

/* doExit()
 *   exit out of shell 
 */
int JAShell::doExit()
{
  cout << "so long :(" << endl;
  return 0;
}
