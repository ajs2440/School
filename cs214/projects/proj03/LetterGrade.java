/* LetterGrade.java computes the letter grade of a student given
 * the average grade
 *
 * Input: The average number grade out of a 100.
 * Precondition: The average is a positive number.
 * Output: The letter grade of the student.
 *
 * Begun by: Dr. Adams, for CS 214, at Calvin College.
 * Completed by: Advait Scaria
 * Date: 02/19/2019
 **********************************************************/


import java.util.Scanner;  // include class for Scanner

public class LetterGrade {

     /* function letterGrade() computes a circle's area, given its radius.
      * Parameter: average, int
      * Precondition: average is not negative.
      * Returns: the letter grade of the student, e.g. 'A', 'B', 'C', 'D', 'F'
      */
     public static char letterGrade(int average) {
     	if (average <= 100 && average >= 0) {
     		switch (average / 10) {
        	case 10: case 9:
        		return 'A';
        	case 8:
        		return 'B';
        	case 7:
        		return 'C';
        	case 6:
        		return 'D';
        	default:
        		return 'F';
        	}
     	} else {
     		return '?';
     	}
     } // letterGrade method
	
  // main program
  public static void main(String[] args) {
      // prompt for number grade
      System.out.print("\n\nEnter the average number grade out of 100: ");

      // Create a connection named keyboard to standard in
      Scanner keyboard = new Scanner(System.in);

      //Get the number from the user
      int average = keyboard.nextInt();

      // output area
      System.out.println("\nThe letter grade is: " + letterGrade(average) + "\n");
  } // main method

} // class letterGrade
