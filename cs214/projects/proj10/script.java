Script started on Tue 30 Apr 2019 04:34:27 PM EDT
ajs244@gold21:~/cs214/projects/proj10/java$ cat *.java
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

/* Birds.java illustrates inheritance and polymorphism.
 *
 * Begun by: Joel Adams, for CS 214 Lab 10 at Calvin College.
 * Completed by: Advait Scaria
 * Date: 04/23/2019s
 *********************************************************/

public class Birds {
  
  public static void main(String[] args) {
      System.out.println("\nWelcome to the Bird Park!\n");

      // Bird bird0 = new Bird();
      // Bird bird1 = new Bird("Hawkeye");
      Bird bird2 = new Duck("Donald");
      Bird bird3 = new Penguin("Peter");
      Bird bird4 = new Goose("Mother");
      Bird bird5 = new Ostrich("Orville");
      Bird bird6 = new Owl("Woodsey");
      Bird bird7 = new Kiwi("Kool");


      // bird1.print();
      bird2.print();
      bird3.print();
      bird4.print();
      bird5.print();
      bird6.print();
      bird7.print();
      System.out.println();
    }
}

/* Duck.java provides a Duck subclass of FlyingBird.
 *
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Completed by: Advait Scaria
 * Date: 04/27/2019
 ******************************************************/

public class Duck extends FlyingBird {

 /* default constructor
  * PostCond: invokes superclass Bird's 
  *         default constructor to set
  *       myName = "".
  */ 
  public Duck() {
      super();
  }

 /* explicit constructor
  * Receive: name, a String 
  * PostCond: myName == name.
  */
  public Duck(String name)
  {     
      super(name);
  }

 /* A Duck's Call
  * Return: a duck-call ("Quack").
  */
  public String call()
  {
     return "Quack";
  }

} 

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
ajs244@gold21:~/cs214/projects/proj10/java$ make
javac -deprecation Birds.java
ajs244@gold21:~/cs214/projects/proj10/java$ java Birds

Welcome to the Bird Park!

Donald Duck just flew past and said, "Quack"
Peter Penguin just walked past and said, "Huh-huh-huh-huuuuh"
Mother Goose just flew past and said, "Honk"
Orville Ostrich just walked past and said, "Snork"
Woodsey Owl just flew past and said, "Whoo-hoo"
Kool Kiwi just walked past and said, "Noot-noot"

ajs244@gold21:~/cs214/projects/proj10/java$ exit

Script done on Tue 30 Apr 2019 04:34:44 PM EDT
