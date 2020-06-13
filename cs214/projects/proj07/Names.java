/* Names.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Advait Scaria
 * Date: 03/29/2019
 ************************************************************/

import java.util.Scanner;

public class Names  
{
  public static void main(String[] args)
  {
      Name aName = new Name("John", "Paul", "Jones");

	    assert aName.getFirst().equals("John");
      assert aName.getMiddle().equals("Paul");
      assert aName.getLast().equals("Jones");

      System.out.println(aName);
      assert aName.toString().equals("John Paul Jones");

      // ------ PROJECT 7 METHODS' TESTS ------
      
      //setFirst() test
      aName.setFirst("Jake");
      assert aName.getFirst().equals("Jake");

      //setMiddle() test
      aName.setMiddle("Joseph");
      assert aName.getMiddle().equals("Joseph");

      //setLast() test
      aName.setLast("Paul");
      assert aName.getLast().equals("Paul");

      //lfmi() test
      assert aName.lfmi().equals("Paul, Jake J.");

      //read() test
      aName.read();
      assert aName.getFirst().equals("Dawson");     //default name that will be input in console to test
      assert aName.getMiddle().equals("Alexander");
      assert aName.getLast().equals("Buist");
      System.out.println(aName);    //visually confirm read works 

      System.out.println("All tests passed!");
  }
}

class Name
   {
      private String myFirst,
                     myMiddle,
                     myLast;

      /* Name explicit constructor...constructs a Name object from three Strings.
       * Receive: first, middle and last, three Strings.
       * POST: Makes a Name object and initializes its three variables to the given parameters.
       */
      public Name(String first, String middle, String last)
   		{
      		myFirst = first;
      		myMiddle = middle;
      		myLast = last;
   		}

   	  /* getFirst()
   	   * PRE: Name is initialized with its three name parts.
       * Return: myFirst, the first name of the Name object.
       */
   	  public String getFirst()
   		{
      		return myFirst;
   		}

      /* setFirst()...project 7 method
       * Receive: first, a String
       * PRE: Valid String passed as first name.
       * POST: set myFirst equal to first.
       */
      public void setFirst(String first)
      {
          myFirst = first;
      }

      /* getMiddle()
   	   * PRE: Name is initialized with its three name parts.
       * Return: myMiddle, the middle name of the Name object.
       */
   	  public String getMiddle()
   		{
      		return myMiddle;
   		}

      /* setMiddle()...project 7 method
       * Receive: middle, a String
       * PRE: Valid String passed as middle name.
       * POST: set myMiddle equal to middle.
       */
      public void setMiddle(String middle)
      {
          myMiddle = middle;
      }

   	  /* getLast()
   	   * PRE: Name is initialized with its three name parts.
       * Return: myLast, the last name of the Name object.
       */
   	  public String getLast()
   		{
      		return myLast;
   		}

      /* setLast()...project 7 method
       * Receive: last, a String
       * PRE: Valid String passed as last name.
       * POST: set myLasr equal to last.
       */
      public void setLast(String last)
      {
          myLast = last;
      }

   	  /* toString()
   	   * PRE: Name is initialized with its three name parts.
       * Return: a String representation of the Name object
       *		 that containts all of its three names in order 
       *     separated by spaces.
       */
   	  public String toString()
   		{
      		return myFirst + ' ' + myMiddle + ' ' + myLast;
   		}

      /* lfmi()...project 7 method
       * PRE: Name is initialized with its three name parts.
       * Return: a String representation of the Name object
       *     that containts all of its three names in the 
       *     order of last name, first name, middle initial.
       */
      public String lfmi()
      {
          return myLast + ", " + myFirst + " " + myMiddle.charAt(0) + ".";  
      }

      /* read()...project 7 method
       * POST: Valid name inputs read from user input and
       *       Name object filled with input values for
       *       first, middle, and last names.
       */
      public void read() 
      {
          Scanner sc = new Scanner(System.in);
          String first = sc.nextLine();
          setFirst(first);
          String middle = sc.nextLine();
          setMiddle(middle);
          String last = sc.nextLine();
          setLast(last);
      }
   };
