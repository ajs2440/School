/* FlyingBird.java provides a Flying Bird subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Advait Scaria
 * Date: 04/27/2019
 ******************************************************/

import java.io.*;

public class FlyingBird extends Bird
{

 /* default constructor
  * PostCond: invokes superclass Bird's 
  *         default constructor to set
  *       myName = "".
  */ 
  public FlyingBird() {
      super();
  }

 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
  public FlyingBird(String name)
  {     
      super(name);
  }

 /* A FlyingBird's movement description
  * Return: "just flew past".
  */
  public String movement()
  {
     return "just flew past";
  }

} 
