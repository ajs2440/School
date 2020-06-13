/* Goose.java provides a Goose subclass of FlyingBird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Advait Scaria
 * Date: 04/27/2019
 ******************************************************/

public class Goose extends FlyingBird {

 /* default constructor
  * PostCond: invokes superclass Bird's 
  *     	  default constructor to set
  *			  myName = "".
  */ 
  public Goose() {
      super();
  }

 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
  public Goose(String name)
  {     
      super(name);
  }

 /* A Goose's Call
  * Return: a goose-call ("Honk!").
  */
  public String call()
  {
     return "Honk";
  }

} 

