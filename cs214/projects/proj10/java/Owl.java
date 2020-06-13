/* Owl.java provides a Owl subclass of FlyingBird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Advait Scaria
 * Date: 04/27/2019
 ******************************************************/

public class Owl extends FlyingBird {

 /* default constructor
  * PostCond: invokes superclass Bird's 
  *         default constructor to set
  *       myName = "".
  */ 
  public Owl() {
      super();
  }

 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
  public Owl(String name)
  {     
      super(name);
  }

 /* A Owl's Call
  * Return: an owl-call ("Whoo-hoo").
  */
  public String call()
  {
     return "Whoo-hoo";
  }

} 

