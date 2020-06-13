/* Ostrich.java provides a Ostrich subclass of WalkingBird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Advait Scaria
 * Date: 04/27/2019
 ******************************************************/

public class Ostrich extends WalkingBird {

 /* default constructor
  * PostCond: invokes superclass Bird's 
  *     	  default constructor to set
  *			  myName = "".
  */ 
  public Ostrich() {
      super();
  }

 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
  public Ostrich(String name)
  {     
      super(name);
  }

 /* A Ostrich's Call
  * Return: an ostrich-call ("Snork").
  */
  public String call()
  {
     return "Snork";
  }

} 

