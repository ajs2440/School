/*
 * CS 232 Homework 2
 * Name: Advait Scaria
 * Date: 02/14/20
 * 
 * copy.c takes in two arguments - <src> and <dest> files and copies contents of the <src> file to the <dest> file
 *                               - <src> must be a text file (not a special file) that exists and has contents to be copied
 *                               - <dest> is created by the program and does not need to be already made as an
 *                                  empty text file
 * 
 * Sources: https://www.programiz.com/c-programming/c-file-input-output - tutorial on how to do read to, write to files
 *          https://stackoverflow.com/questions/3463426/in-c-how-should-i-read-a-text-file-and-print-all-strings 
 *              - read in chars from input file and paste onto output file one by one
 *          https://cboard.cprogramming.com/c-programming/133346-determine-file-type-linux.html
 *              - to figure out if file is regular or not
*/

#include <stdio.h>
#include <unistd.h>
#include <sys/stat.h>

int main(int argcmd, char *arglist[])
{
    // Initialize variables to be used
    char c;
    FILE *my_input = NULL;
    FILE *my_output = NULL;
    char *src = arglist[1];
    char *dest = arglist[2];
    struct stat buffer;
    stat(src, &buffer);

    // Wrong number of arguments detected in command - should get three: 1. copy, 2. <src>, 3. <dest>
    if (argcmd != 3) {
        fprintf(stderr, "\nError - Wrong number of arguments, expected:\n\tcopy <src> <dest>\n\n");
        return -1;
    }

    // Input file could not be opened
    if ((my_input = fopen(src, "r")) == NULL){
        fprintf(stderr, "\nError - Could not open '%s'.\n\n", src);
        return -1;
    } 

    // Check if special file
    if (S_ISREG(buffer.st_mode) == 0){
        fprintf(stderr, "\nError - '%s' is a special file.\n\n", src);
        return -1;
    }

    // Check for read permission of input source file
    if (access(src, R_OK) == -1){
        fprintf(stderr, "\nError - No read permission for '%s'.\n\n", src);
        return -1;
    }
    
    // Output file already exists
    if ((my_output = fopen(dest, "r")) != NULL){
        fprintf(stderr, "\nError - File to be copied to, '%s', already exists!\n\n", dest);
        return -1;
    }

    // Output file could not be made -- user provided an invalid file name or path
    if ((my_output = fopen(dest, "w")) == NULL){
        fprintf(stderr, "\nError - Could not make '%s'.\n\n", dest);
        return -1;
    }

    // If all error checks above pass, do the copying 
    my_input = fopen(src, "r");
    my_output = fopen(dest, "w");

    // https://stackoverflow.com/questions/3463426/in-c-how-should-i-read-a-text-file-and-print-all-strings
    if (my_input) {
        while ((c = fgetc(my_input)) != EOF)
            fputc(c, my_output);
    fclose(my_input);
    fclose(my_output);
    }
    return 0;
}