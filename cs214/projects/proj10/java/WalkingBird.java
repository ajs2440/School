/* WalkingBird.java provides a Walking Bird subclass of Bird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Advait Scaria
 * Date: 04/27/2019
 ******************************************************/

import java.io.*;

public class WalkingBird extends Bird
{

 /* default constructor
  * PostCond: invokes superclass Bird's 
  *         default constructor to set
  *       myName = "".
  */ 
  public WalkingBird() {
      super();
  }

 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
  public WalkingBird(String name)
  {     
      super(name);
  }

 /* A WalkingBird's movement description
  * Return: "just flew past".
  */
  public String movement()
  {
     return "just walked past";
  }

} 
