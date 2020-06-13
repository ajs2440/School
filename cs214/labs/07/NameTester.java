/* NameTester.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Advait Scaria
 * Date: 03/28/2019
 ************************************************************/

public class NameTester  
{
  public static void main(String[] args)
  {
      Name aName = new Name("John", "Paul", "Jones");

	  assert aName.getFirst().equals("John") ;
      assert aName.getMiddle().equals("Paul") ;
      assert aName.getLast().equals("Jones") ;

      System.out.println(aName);
      assert aName.toString().equals("John Paul Jones");

      System.out.println("All tests passed!");
  }
}

class Name
   {
      private String myFirst,
                     myMiddle,
                     myLast;

      /* Name explicit constructor...constructs a Name object from three strings.
       * Receive: first, middle and last, three strings.
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

      /* getMiddle()
   	   * PRE: Name is initialized with its three name parts.
       * Return: myMiddle, the middle name of the Name object.
       */
   	  public String getMiddle()
   		{
      		return myMiddle;
   		}

   	  /* getLast()
   	   * PRE: Name is initialized with its three name parts.
       * Return: myLast, the last name of the Name object.
       */
   	  public String getLast()
   		{
      		return myLast;
   		}

   	  /* toString()
   	   * PRE: Name is initialized with its three name parts.
       * Return: a String representation of the Name object
       *		 that containts all of its three names together
       *		 separated by spaces.
       */
   	  public String toString()
   		{
      		return myFirst + ' ' + myMiddle + ' ' + myLast;
   		}
   };
