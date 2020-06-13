Script started on Wed 03 Apr 2019 02:23:58 PM EDT
ajs244@gold29:~/cs214/labs/08/java$ cat NameTester.java
/* NameTester.java is a 'driver' to test class Name.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Advait Scaria
 * Date: 04/03/2019
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


ajs244@gold29:~/cs214/labs/08/java$ javac -deprecation NameTester.java
ajs244@gold29:~/cs214/labs/08/java$ java NameTester
John Paul Jones
All tests passed!
ajs244@gold29:~/cs214/labs/08/java$ exit

Script done on Wed 03 Apr 2019 02:24:48 PM EDT
