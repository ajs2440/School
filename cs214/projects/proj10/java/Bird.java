/* Bird.java provides a Bird class.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Advait Scaria
 * Date: 04/23/2019
 ******************************************************/

import java.io.*;

abstract class Bird
{

 /* default constructor
  * PostCond: myName == "".
  */
  public Bird()
  {
	myName = "";
  } 

 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
  public Bird(String name)
  {
	myName = name;
  } 

 /* Name accessor
  * Return: myName.
  */
  public String getName()
  {
	return myName;
  }

 /* A Bird's Call
  * Return: a default bird-call ("Squawk!").
  */
  public String call()
  {
	return "Squaaaaaaaaaawk!";
  } 

 /* A Bird's movement
  * Return: String describing Bird's movement
  * 		(defined in subclass).
  */
  public abstract String movement();

 /* Output a Bird 
  * Output: Everything known about myself
  *          to the standard output stream.
  */
  public void print()
  {
	System.out.println( getName() + ' ' + getClass().getName()
                        + ' ' + movement() + " and said, " + "\"" + call() + "\"" );
  } 


  private String myName;
}

