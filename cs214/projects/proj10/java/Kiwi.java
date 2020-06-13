/* Kiwi.java provides a Kiwi subclass of WalkingBird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Advait Scaria
 * Date: 04/27/2019
 ******************************************************/

public class Kiwi extends WalkingBird {

 /* default constructor
  * PostCond: invokes superclass Bird's 
  *     	  default constructor to set
  *			  myName = "".
  */ 
  public Kiwi() {
      super();
  }

 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
  public Kiwi(String name)
  {     
      super(name);
  }

 /* A Kiwi's Call
  * Return: a kiwi-call ("Noot-noot").
  */
  public String call()
  {
     return "Noot-noot";
  }

} 

