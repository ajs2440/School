Script started on Fri 01 Mar 2019 06:32:42 PM EST
ajs244@gold27:~/cs214/labs/05$ cat Split.java
/* Split.java is a class and program that splits a string
 * into two substrings.
 * 
 * Begun by: Serita Nelesen
 * Completed by: Advait Scaria
 * Date: 02/27/2019
 ***************************************************************/

import java.util.Scanner;

// java class Split
public class Split
{
  // main program
  public static void main(String[] args)
    {
      Scanner keyboard = new Scanner(System.in);
      // prompt for the string
      System.out.println("\nTo split a string, enter the string: ");
      String theString = keyboard.next();
      
      // prompt for splitting position
      System.out.println("\nEnter the split position: ");
      int position = keyboard.nextInt();

      //Create list, compute results and print
      String [] resultList = new String[2];
      splitter(theString, position, resultList);
      System.out.println("\nThe first part is " + resultList[0] + "\n and the second part is " + resultList[1]);
      
    }
  
  /* splitter() splits a string according to the position specified
   * Receive: 	theString - the string to be split
   * 		pos - the position at which to split
   *            resList - an array of strings in which to place results
   *****************************************************/
  public static void splitter(String theString, int pos, String[] results) {
  	String part1 = theString.substring(0, pos);
  	String part2 = theString.substring(pos, theString.length());
  	results[0] = part1;
  	results[1] = part2;
  }
}
ajs244@gold27:~/cs214/labs/05$ javac -deprecation Split.java
ajs244@gold27:~/cs214/labs/05$ java Split

To split a string, enter the string: 
hello

Enter the split position: 
0

The first part is 
 and the second part is hello
ajs244@gold27:~/cs214/labs/05$ java Split

To split a string, enter the string: 
hello

Enter the split position: 
3

The first part is hel
 and the second part is lo
ajs244@gold27:~/cs214/labs/05$ java Split

To split a string, enter the string: 
hello

Enter the split position: 
5

The first part is hello
 and the second part is 
ajs244@gold27:~/cs214/labs/05$ exit

Script done on Fri 01 Mar 2019 06:33:46 PM EST
