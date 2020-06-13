Script started on Tue 26 Feb 2019 02:18:08 PM EST
ajs244@maroon24:~/cs214/projects/proj04$ cat Factorial.java
/* Factorial.java computes the factorial of the given number n
 *
 * Input: n, an integer.
 * Precondition: n is a positive integer.
 * Output: the factorial of n.
 *
 * Begun by: Dr. Adams, for CS 214, at Calvin College.
 * Completed by: Advait Scaria
 * Date: 02/22/2019
 **********************************************************/


import java.util.Scanner;  // include class for Scanner

public class Factorial {
	
  // main program
  public static void main(String[] args) {
      // prompt for integer n
      System.out.print("\n\nTo compute n!, enter n: ");

      // Create a connection named keyboard to standard in
      Scanner keyboard = new Scanner(System.in);

      //Get the number from the user
      int n = keyboard.nextInt();

      // output area
      System.out.println("\n" + n + "! = " + factorial(n) + "\n");
  } // main method


  /* function factorial() computes and returns an integer's factorial.
   * Parameter: n, integer.
   * Precondition: n is not negative.
   * Returns: the factorial of n.
   */
  public static int factorial(int n) {
      int answer = 1;
      if (n >= 0) {
        for (int i = 2; i <= n; i++) {
          answer *= i;
        }
        return answer;
      } else {
        return -1;	// error condition, n not >= 0
      }
  } // factorial method

} // class Factorial
ajs244@maroon24:~/cs214/projects/proj04$ javac -deprecation Factorial.java
ajs244@maroon24:~/cs214/projects/proj04$ java Factorial


To compute n!, enter n: -1

-1! = -1

ajs244@maroon24:~/cs214/projects/proj04$ java Factorial


To compute n!, enter n: 0

0! = 1

ajs244@maroon24:~/cs214/projects/proj04$ java Factorial


To compute n!, enter n: 2

2! = 2

ajs244@maroon24:~/cs214/projects/proj04$ java Factorial


To compute n!, enter n: 4

4! = 24

ajs244@maroon24:~/cs214/projects/proj04$ java Factorial


To compute n!, enter n: 10

10! = 3628800

ajs244@maroon24:~/cs214/projects/proj04$ exit

Script done on Tue 26 Feb 2019 02:18:37 PM EST
