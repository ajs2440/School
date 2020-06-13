Script started on Thu 07 Mar 2019 11:05:24 PM EST
ajs244@gold27:~/cs214/projects/proj05$ cat Roots.java
/* Roots.java is a driver for method quadraticRoots().
 *
 * Started by: Prof. Adams, for CS 214 at Calvin College
 *
 * Student Name: Advait Scaria
 * Date: 03/07/2019
 *
 * Precondition: a valid quadratic equation must be given.
 * Output: the roots of the quadratic equation.
 ***************************************************************/

import java.io.*;
import java.util.*;
import java.lang.Math;

public class Roots
{
  public static void main(String[] args) {
      // prompt for user input about quadratic equation
      System.out.println("\nTo compute the roots enter the values of the coefficients: ");
      Scanner input = new Scanner(System.in);
      
      System.out.print("\ta = ");
      double a = input.nextDouble();

      System.out.print("\tb = ");
      double b = input.nextDouble();

      System.out.print("\tc = ");
      double c = input.nextDouble();

      double[] rootsList = new double[2];
      boolean valid = quadraticRoots(a, b, c, rootsList);

      if (valid) {
        System.out.println("\n\tthe first root is = " + rootsList[0]);
        System.out.println("\tthe second root is = " + rootsList[1]);
        System.out.println();
      }
      
  }

  /* quadraticRoots() is a method that computes the roots of the given 
   * quadratic equation
   * Receive: a, first coefficient double
              b, second coefficient double
              c, third coefficient double
   * Return: bool, true if there are 2 valid roots, false otherwise.
   ************************************************************/

  public static boolean quadraticRoots(double a, double b, double c, 
                                    double[] rootsList) 
  {
   		if (a != 0) {
        double arg = Math.pow(b, 2.0) - 4 * a * c;
        if (arg >= 0) {
          rootsList[0] = (-b + Math.sqrt(arg))/(2 * a);
          rootsList[1] = (-b - Math.sqrt(arg))/(2 * a);
          return true;
        } else {
          System.out.println("\n\tb^2 - 4ac is negative!\n ");
          return false;
        }
      } else {
        System.out.println("\n\ta is zero!\n ");
        return false;
      }
  }
}
ajs244@gold27:~/cs214/projects/proj05$ javac -deprecation Roots.java
ajs244@gold27:~/cs214/projects/proj05$ java Roots

To compute the roots enter the values of the coefficients: 
	a = 0
	b = 2
	c = 3

	a is zero!
 
ajs244@gold27:~/cs214/projects/proj05$ java Roots

To compute the roots enter the values of the coefficients: 
	a = 2
	b = 1
	c = 4

	b^2 - 4ac is negative!
 
ajs244@gold27:~/cs214/projects/proj05$ java Roots

To compute the roots enter the values of the coefficients: 
	a = 2
	b = 5
	c = 2

	the first root is = -0.5
	the second root is = -2.0

ajs244@gold27:~/cs214/projects/proj05$ java Roots

To compute the roots enter the values of the coefficients: 
	a = 1
	b = -4
	c = 4

	the first root is = 2.0
	the second root is = 2.0

ajs244@gold27:~/cs214/projects/proj05$ exit

Script done on Thu 07 Mar 2019 11:06:54 PM EST
