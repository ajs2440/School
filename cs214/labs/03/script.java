Script started on Wed 13 Feb 2019 10:49:42 AM EST
ajs244@gold34:~/cs214/labs/03$ cat YearCodes.a java
/* YearCodes.java is a driver for function yearCode().
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 ****************************************************************/

import java.util.Scanner;

public class YearCodes {

   public static void main(String[] args) {
      Scanner keyboard = new Scanner(System.in);
      System.out.println("\nEnter your academic year: "); // prompt

      String year = keyboard.next();      // read year
      System.out.println(yearCode(year)); // display its code
   }

   /***************************************************************
    * yearCode() converts an academic year into its integer code.
    *
    * Receive: year, a string.
    * PRE: year is one of {freshman, sophomore, junior, or senior}.
    * Return: the integer code corresponding to year.
    */

public static int yearCode(String year){
   	if (year.equals("freshman"))
    	return 1;
    else if (year.equals("sophomore"))
        return 2;
    else if (year.equals("junior"))
        return 3;
    else if (year.equals("senior"))
        return 4;
    else
        return 0;
}

}
ajs244@gold34:~/cs214/labs/03$ javac -deprecation YearCodes.java
ajs244@gold34:~/cs214/labs/03$ java YearCoe des

Enter your academic year: 
freshman
1
ajs244@gold34:~/cs214/labs/03$ java YearCodes

Enter your academic year: 
soh phomore
2
ajs244@gold34:~/cs214/labs/03$ java YearCodes

Enter your academic year: 
junior
3
ajs244@gold34:~/cs214/labs/03$ java YearCodes

Enter your academic year: 
senior
4
ajs244@gold34:~/cs214/labs/03$ java YearCodes

Enter your academic year: 
Freshman
0
ajs244@gold34:~/cs214/labs/03$ java YearCodes

Enter your academic year: 
lolqwu   wut
0
ajs244@gold34:~/cs214/labs/03$ exit

Script done on Wed 13 Feb 2019 10:50:52 AM EST
