Script started on Fri 15 Mar 2019 04:40:23 PM EDT
ajs244@gold29:~/cs214/projects/proj06$ cat Arrays.java
/* Arrays.java is a driver for array methods printArray() and readArray().
 *
 * Started by: Prof. Adams, for CS 214 at Calvin College
 *
 * Student Name: Advait Scaria
 * Date: 03/08/2019
 *
 * Precondition: valid size and double numbers must be input.
 * Output: prints elements of anArray to console or reads and fills
 *          elements into anArray from console input.
 ***************************************************************/

import java.io.*;
import java.util.*;

public class Arrays
{
  public static void main(String[] args) {
      // prompt for user input about array's size
      System.out.print("\nEnter the size of the array: ");
      Scanner input = new Scanner(System.in);
          
      int size = input.nextInt();
      double[] anArray = new double[size];

      System.out.println();
      readArray(anArray, size);
      printArray(anArray, size);
      System.out.println();
      System.out.println();
  }

  /* readArray() is a method that reads the inputted elements and 
   *              fills anArray with those elements.
   * Receive: anArray, an array with double elements
              itsSize, type int - specifies anArray's size.
   * Return: void.
   * Precondition: Size must be > 0.
   * Postcondition: Reads valid element inputs from console and 
   *                populates anArray with them.
   ********************************************************************/

  public static void readArray(double[] anArray, int itsSize) {
      for (int i = 0; i < itsSize; i++) {
        System.out.print("Enter element " + (i + 1) + ": ");
        Scanner arrayInput = new Scanner(System.in);
        anArray[i] = arrayInput.nextDouble();
      }
  }

  /* printArray() is a method that prints the elements within an array.
   * Receive: anArray, an array with double elements
              itsSize, type int - specifies anArray's size.
   * Return: void.
   * Precondition: Size must be >= 0.
   * Postcondition: Prints elements of anArray to console.
   ********************************************************************/

  public static void printArray(double[] anArray, int itsSize) {
      System.out.print("\nHere are the elements in your array: ");
   	  for (int i = 0; i < itsSize; i++) {
        if (i == itsSize - 1) {
          System.out.print(anArray[i]);
        } else {
          System.out.print(anArray[i] + ", ");
        }
      }
  }
}
ajs244@gold29:~/cs214/projects/proj06$ cat Arrays.java[4Pjava Arraysc -deprecation Arrays.java
ajs244@gold29:~/cs214/projects/proj06$ javac -deprecation Arrays.java[15Pcat Arrays.java[4Pjava Arrays

Enter the size of the array: 2

Enter element 1: 1
Enter element 2: 4

Here are the elements in your array: 1.0, 4.0

ajs244@gold29:~/cs214/projects/proj06$ java Arrays

Enter the size of the array: 5

Enter element 1: 5
Enter element 2: 4
Enter element 3: 3
Enter element 4: 2
Enter element 5: 1

Here are the elements in your array: 5.0, 4.0, 3.0, 2.0, 1.0

ajs244@gold29:~/cs214/projects/proj06$ exit

Script done on Fri 15 Mar 2019 04:41:21 PM EDT