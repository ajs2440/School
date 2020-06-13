/* Penguin.java provides a Penguin subclass of WalkingBird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Advait Scaria
 * Date: 04/27/2019
 ******************************************************/

public class Penguin extends WalkingBird {

 /* default constructor
  * PostCond: invokes superclass Bird's 
  *     	  default constructor to set
  *			  myName = "".
  */ 
  public Penguin() {
      super();
  }

 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
  public Penguin(String name)
  {     
      super(name);
  }

 /* A Penguin's Call
  * Return: a penguin-call ("Huh-huh-huh-huuuuh").
  */
  public String call()
  {
     return "Huh-huh-huh-huuuuh";
  }

} 

