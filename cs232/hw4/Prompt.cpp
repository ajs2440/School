/* Prompt - definitions for Prompt methods
 *
 * Written by:
 *    Josh Ridder (jmr59)
 *    Advait Scaria (ajs244)
 * Date: 3/13/20
 * 
 * For CS 232 at Calvin University
 */

#include "Prompt.h"

/* Prompt constructor
 * constructs a Prompt object 
 *      by initializing cwd to the path of the current working directory
 *  
 */
Prompt::Prompt() {
    cwd = get_current_dir_name();
}

/* Prompt::get()
 * returns cwd which is the path to the current working directory
 *  
 */
string Prompt::get() const {
    return cwd;
}
