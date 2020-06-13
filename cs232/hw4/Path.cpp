/* Path - definitions for Path methods
 *
 * Written by:
 *    Josh Ridder (jmr59)
 *    Advait Scaria (ajs244)
 * Date: 3/13/20
 * 
 * For CS 232 at Calvin University
 */

#include "Path.h"
using namespace std;

/* Path constructor
 * constructs a Path object 
 *  - initializes the list_directories private variable to store 
 *    the different paths to the directories listed under the "PATH" environment separated by colons
 */
Path::Path() {
    env_var = getenv("PATH");
    char* token = strtok(env_var, ":");
    while(token != NULL)
    {
        list_directories.push_back(token);
        token = strtok(NULL, ":");
    }
}

/* Path::find()
 * @param: const string& program, the program whose path must be found
 * @return: int index, the index of the directory containing program
 *          or -1 if no directory is found.
 * 
 * Used: http://www.cplusplus.com/forum/general/3221/ as reference 
 */
int Path::find(const string& program) const {
    for (int i = 0; i < list_directories.size(); i++) {
        DIR *dir = opendir(list_directories[i]);                    // open directory starting at index 0
        while(dir) {                                        
            struct dirent *ent;                     
            while((ent = readdir(dir)) != NULL) {                   // read directory into ent
                if(strcmp(ent->d_name, program.c_str()) == 0) {           // if filename matches program
                    closedir(dir);
                    return i;                                       // return index i
                }
            }
            closedir(dir);
            break;
        }
    }
    return -1;                    // if it reaches here, it means program wasn't found so return -1
}

/* Path::getDirectory()
 * @param: int i, the index of the directory that must be found
 * @return: string directory_name, the name of the directory of the corresponding index i
 *          or range_error if index i is out of range.
 */
string Path::getDirectory(int i) const {
    if(i >= list_directories.size() || i < 0) {
        throw range_error("string Path::getDirectory(int i) -- index i is out of range for list_directories[]");
    }
    return list_directories[i];
}