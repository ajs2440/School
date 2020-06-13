/* Owl.java provides an Owl subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Advait Scaria
 * Date: 04/23/2019
 ******************************************************/

public class Owl extends Bird {

 /* default constructor
  * PostCond: invokes superclass Bird's 
  *     	  default constructor to set
  *			  myName = "".
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

 /* An Owl's Call
  * Return: an owl-call ("Whoo-hoo!").
  */
  public String call()
  {
     return "Whoo-hoo!";
  }

} 

