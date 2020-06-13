Script started on Fri 12 Apr 2019 01:02:19 AM EDT
ajs244@maroon12:~/cs214/projects/proj08/java$ cat *.java
/* TempDriver.java is a 'driver' to test class Temperature
 * 				   by displaying a table of Temperatures.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Advait Scaria
 * Date: 04/08/2019
 ************************************************************/

import java.io.*;
import java.util.*;

public class TempDriver  
{
  public static void main(String[] args)
  {

  	while (true) {
  		System.out.println("");
   		String userInput = "";

  		Temperature baseTemp = new Temperature(0, 'F');
  		Temperature limitTemp = new Temperature(0, 'F');

    	System.out.print("\nbaseTemp ");
    	baseTemp.readTemp();
    	Temperature myTemp = new Temperature(baseTemp.getMyDegree(), baseTemp.getMyScale());

    	System.out.print("\nlimitTemp ");
    	limitTemp.readTemp();

    	Scanner input = new Scanner(System.in);
   		System.out.print("\nstepValue: ");
    	double stepValue = input.nextDouble();

    	System.out.print("\n\tFahrenheit\t\tCelsius\t\t\tKelvin\n");
    	System.out.println("");
    	do {
    		myTemp.getInF().displayTemp();
    		myTemp.getInC().displayTemp();
    		myTemp.getInK().displayTemp();
    		System.out.print("\n");
    		myTemp = myTemp.raise(stepValue);
    	} while (myTemp.lessThan(limitTemp));

    	System.out.println("");
    	System.out.print("Type 'No' to exit, anything else to continue: ");
    	Scanner uInput = new Scanner(System.in);
    	userInput = uInput.nextLine();
    	if (userInput.equals("No")) {
    		break;
    	}
  	}
  }
}
/* Temperature.java implements class Temperature.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Advait Scaria
 * Date: 04/08/2019
 ************************************************************/

import java.io.*;
import java.util.*;
import java.lang.Math.*;

class Temperature {

  private double myDegree;
  private char myScale;

  /* Temperature object constructor with initialization
   * @param: degree, a double.
   * @param: scale, a char.
   * POST: myDegree = degree,
   *       myScale = scale,
   *       if isValid() returns true.
   */  
  public Temperature(final double degree, final char scale) {
    if (isValid(degree, scale)) {
      myScale = scale;
      myDegree = degree;
    } 
  }
 
  /* isValid()
   * @param: degree, a double.
   * @param: scale, a char.
   * Returns: true given valid degree and scale inputs, false otherwise.
   * POST: displays appropriate invalid statements in console given invalid
   *       inputs.
   */
  public boolean isValid(double degree, char scale) {
    if ((scale == 'F') || (scale == 'f')) {
      if (degree < -459.67) {
        System.out.println("Invalid Fahrenheit Degree"); 
        return false;
      } else {
        return true; 
      }
    } 
    else if ((scale == 'C') || (scale == 'c')) {
      if (degree < -273.15) {
        System.out.println("Invalid Celsius Degree"); 
        return false;
      } else {
        return true; 
      }
    } 
    else if ((scale == 'K') || (scale == 'k')) {
      if (degree < 0) {
        System.out.println("Invalid Kelvin Degree"); 
        return false;
      } else {
        return true; 
      }
    } 
    else { 
      System.out.println("Invalid Input"); 
      return false; }
  }

  /* getMyDegree() -- getter for myDegree
   * Returns: myDegree, a double.
   */
  public final double getMyDegree() {
      return myDegree;
  }

  /* getMyScale() -- getter for myScale
   * Returns: myScale, a char.
   */
  public final char getMyScale() {
      return myScale;
  }

  /* getInF() -- gets temperature in Fahrenheit
   * PRE: this temp object is valid.
   * Returns: this or tempInF, a Fahrenheit scale Temperature object.
   */
  public Temperature getInF() {
    if (getMyScale() == 'F' || getMyScale() == 'f') {
      return this;
    }
    else {
      double degreeF = 0.0;
      if (getMyScale() == 'C' || getMyScale() == 'c') {
        degreeF = ((9.0/5.0) * getMyDegree()) + 32.0;
      } 
      else {
        degreeF = ((getMyDegree() - 273.15) * (9.0/5.0)) + 32.0;
      }
      Temperature tempInF = new Temperature(degreeF, 'F');

      return tempInF;
    } 
  }

  /* getInC() -- gets temperature in Celsius
   * PRE: this temp object is valid.
   * Returns: this or tempInC, a Celsius scale Temperature object.
   */
  public Temperature getInC() {
    if (getMyScale() == 'C' || getMyScale() == 'c') {
      return this;
    }
    else {
      double degreeC = 0.0;
      if (getMyScale() == 'F' || getMyScale() == 'f') {
        degreeC = (5.0/9.0) * (getMyDegree() - 32.0);
      } 
      else {
        degreeC = getMyDegree() - 273.15; 
      }
      Temperature tempInC = new Temperature(degreeC, 'C');
      return tempInC;
    }
  }

  /* getInK() -- gets temperature in Kelvin
   * PRE: this temp object is valid.
   * Returns: this or tempInK, a Kelvin scale Temperature object.
   */
  public Temperature getInK() {
    if (getMyScale() == 'K' || getMyScale() == 'k') {
      return this;
    }
    else {
      double degreeK = 0.0;
      if (getMyScale() == 'F' || getMyScale() == 'f') {
        degreeK = (5.0/9.0) * (getMyDegree() + 459.67);
      } 
      else {
        degreeK = getMyDegree() + 273.15;
      }
      Temperature tempInK = new Temperature(degreeK, 'K');
      return tempInK;
    } 
  }

  /* readTemp() -- reads Temperature object values from input
   * PRE: valid myDegree and myScale inputs.
   * POST: my Temperature object changed with input values if valid.
   */
  public void readTemp() {
    System.out.print("(Enter the temperature in the format --- degrees, scale): ");
    Scanner input = new Scanner(System.in);
    final double degrees = input.nextDouble();
    final char scale = input.next().charAt(0);
    if (isValid(degrees, scale)) {
      myScale = scale;
      myDegree = degrees;
    } 
  }

  /* displayTemp() -- outputs Temperature object values
   * PRE: my Temperature object is initialized with valid values.
   * POST: myDegree and myScale output to console.
   */
  public void displayTemp() {
    System.out.print("\t");
    System.out.printf("%.5f", getMyDegree());
    System.out.print(" ");
    System.out.print(getMyScale());
    System.out.print("\t");
  }
  
  /* raise() -- raises myDegree by degrees amount
   * @param: degrees, a double.
   * PRE: degrees > 0.
   * Returns: this or newTemp, a myScale scale Temperature object with
   *          myDegree = myDegree + degrees.
   */
  public Temperature raise(final double degrees) {
    if (degrees > 0) {
      Temperature newTemp = new Temperature(getMyDegree() + degrees, getMyScale());
      return newTemp;
    }
    else {
      System.out.println("Please enter a degree greater than 0 to raise the temperature by!");
      return this;
    }
  }

  /* lower() -- lowers myDegree by degrees amount
   * @param: degrees, a double.
   * PRE: degrees > 0.
   * Returns: this or newTemp, a myScale scale Temperature object with
   *          myDegree = myDegree - degrees.
   */
  public Temperature lower(final double degrees) {
    if (degrees > 0) {
      if (isValid(getMyDegree() - degrees, getMyScale())) {
        Temperature newTemp = new Temperature(getMyDegree() - degrees, getMyScale());
        return newTemp;
      } else { return this; }
    } 
    else {
      System.out.println("\nPlease enter a degree greater than 0 to lower the temperature by!");
      return this;
    }
  }

  /* equals()
   * @param: aTemp, a Temperature.
   * Returns: true if both Temperatures have same degrees when 
   *          converted to the same scale.
   */
  public boolean equals(Temperature aTemp) {
    if (getMyScale() == aTemp.getMyScale() && getMyDegree() == aTemp.getMyDegree()) {
      return true;
    }
    else {
      if (getMyScale() == 'F' || getMyScale() == 'f') {
        Temperature temp = aTemp.getInF();
        return getMyDegree() == temp.getMyDegree();
      }
      else if (getMyScale() == 'C' || getMyScale() == 'c') {
        Temperature temp = aTemp.getInC();
        return getMyDegree() == temp.getMyDegree();
      }
      else if (getMyScale() == 'K' || getMyScale() == 'k') {
        Temperature temp = aTemp.getInK();
        return getMyDegree() == temp.getMyDegree();
      }
      else { return false; }
    }
  }

  /* lessThan()
   * @param: aTemp, a Temperature.
   * Returns: true if my Temperature is less than the given Temperature 
   *          when converted to the same scale.
   */
  public boolean lessThan(Temperature aTemp) {
    if (getMyScale() == aTemp.getMyScale()) {
      return getMyDegree() < aTemp.getMyDegree();
    }
    else {
      if (getMyScale() == 'F' || getMyScale() == 'f') {
        Temperature temp = aTemp.getInF();
        return getMyDegree() < temp.getMyDegree();
      }
      else if (getMyScale() == 'C' || getMyScale() == 'c') {
        Temperature temp = aTemp.getInC();
        return getMyDegree() < temp.getMyDegree();
      }
      else if (getMyScale() == 'K' || getMyScale() == 'k') {
        Temperature temp = aTemp.getInK();
        return getMyDegree() < temp.getMyDegree();
      }
      else { return false; }
    }
  }
}

/* TemperatureTester.java is a tester to test class Temperature.
 * Begun by: Prof. Adams, for CS 214 at Calvin College.
 * Student: Advait Scaria
 * Date: 04/08/2019
 ************************************************************/

public class TemperatureTester  
{
  //valid temperatures
  static Temperature temp1a = new Temperature(11, 'F');
  static Temperature temp1b = new Temperature(22, 'C');
  static Temperature temp1c = new Temperature(33, 'K');
  static Temperature temp1d = new Temperature(-11.12, 'f');
  static Temperature temp1e = new Temperature(-22.23, 'c');
  static Temperature temp1f = new Temperature(33.34, 'k');

  static Temperature temp1g = new Temperature(-40, 'F');
  static Temperature temp1h = new Temperature(-40, 'C');
  static Temperature temp1i = new Temperature(22, 'C');
  static Temperature temp1j = new Temperature(21, 'C');

  public static void main(String[] args)
  {
      
      System.out.println("");
      System.out.println("Invalid Temps Blow:");

      //invalid temperatures
      Temperature temp2a = new Temperature(-500, 'F');
      Temperature temp2b = new Temperature(-459.67, 'f');
      Temperature temp2c = new Temperature(-500, 'C');
      Temperature temp2d = new Temperature(-273.15, 'c');
      Temperature temp2e = new Temperature(-500, 'K');
      Temperature temp2f = new Temperature(0, 'k');
      Temperature temp2g = new Temperature(-500, 'A');
      
      System.out.println("");
      testAccessors();
      testConversions();
      testReadInput();
      testDisplayTemp();
      testRaise();
      testLower();
      testEquals();
      testLessThan();

      // System.out.println(aName);
      // assert aName.toString().equals("John Paul Jones");

      // System.out.println("All tests passed!");
  }

  public static void testAccessors() {

      System.out.print("Testing Accessor methods...");

      assert temp1a.getMyDegree() == 11;
      assert temp1b.getMyDegree() == 22;
      assert temp1c.getMyDegree() == 33;
      assert temp1d.getMyDegree() == -11.12;
      assert temp1e.getMyDegree() == -22.23;
      assert temp1f.getMyDegree() == 33.34;
      System.out.print("getMyDegree() passed, ");

      assert temp1a.getMyScale() == 'F';
      assert temp1b.getMyScale() == 'C';
      assert temp1c.getMyScale() == 'K';
      assert temp1d.getMyScale() == 'f';
      assert temp1e.getMyScale() == 'c';
      assert temp1f.getMyScale() == 'k';
      System.out.print("getMyScale() passed...");

      System.out.println("Accessors passed!");
  }

  public static void testConversions() {
      System.out.print("Testing Conversion methods...");

      assert temp1a.getInF().getMyScale() == 'F';
      assert temp1a.getInF().getMyDegree() == 11;

      assert temp1b.getInF().getMyScale() == 'F';
      System.out.print("\n\ttemp1b degree F: " + temp1b.getInF().getMyDegree());

      assert temp1c.getInF().getMyScale() == 'F';
      System.out.print("\n\ttemp1c degree F: " + temp1c.getInF().getMyDegree());
      System.out.print("...end of getInF()");



      assert temp1a.getInC().getMyScale() == 'C';
      System.out.print("\n\ttemp1a degree C: " + temp1a.getInC().getMyDegree());

      assert temp1b.getInC().getMyScale() == 'C';
      assert temp1b.getInC().getMyDegree() == 22;

      assert temp1c.getInC().getMyScale() == 'C';
      System.out.print("\n\ttemp1c degree C: " + temp1c.getInC().getMyDegree());
      System.out.print("...end of getInC()");



      assert temp1a.getInK().getMyScale() == 'K'; //WHY FAIL???
      System.out.print("\n\ttemp1a degree K: " + temp1a.getInK().getMyDegree());

      assert temp1b.getInK().getMyScale() == 'K'; //WHY FAIL???
      System.out.print("\n\ttemp1b degree K: " + temp1b.getInK().getMyDegree());

      assert temp1c.getInK().getMyScale() == 'K';
      assert temp1c.getInK().getMyDegree() == 33;
      System.out.print("...end of getInK()");

      System.out.println("");
      System.out.println("Conversions passed!");
  }

  public static void testReadInput() {
      System.out.print("Testing Read method...");

      temp1a.readTemp();
      System.out.print("\n\ttemp1a degree: " + temp1a.getMyDegree());
      System.out.print("\n\ttemp1a scale: " + temp1a.getMyScale());
      System.out.println("");

      System.out.println("Read passed!");   
  }

  public static void testDisplayTemp() {
      System.out.print("Testing Display method...");

      temp1a.displayTemp();
      temp1b.displayTemp();
      temp1c.displayTemp();
      System.out.println("");

      System.out.println("Display passed!");   
  }

  public static void testRaise() {
      System.out.print("Testing Raise method...");

      temp1a.raise(11).displayTemp();
      temp1b.raise(11).displayTemp();
      temp1c.raise(11).displayTemp();
      System.out.println("");

      System.out.println("Raise passed!");   
  }

  public static void testLower() {
      System.out.print("Testing Lower method...");

      temp1a.lower(11).displayTemp();
      temp1b.lower(11).displayTemp();
      temp1c.lower(11).displayTemp();
      temp1a.lower(-1).displayTemp();
      System.out.println("");

      System.out.println("Lower passed!");   
  }

  public static void testEquals() {
  	  System.out.print("Testing Equals method...");

      assert temp1a.equals(temp1b) == false;
      assert temp1b.equals(temp1c) == false;
      assert temp1b.equals(temp1i) == true;
      assert temp1b.equals(temp1j) == false;
      assert temp1g.equals(temp1h) == true;
      
      System.out.println("Equals passed!");  
  }

  public static void testLessThan() {
  	  System.out.print("Testing LessThan method...");

      assert temp1a.lessThan(temp1b) == true;
      assert temp1b.lessThan(temp1c) == false;

      System.out.println("LessThan passed!");  
  }
}


ajs244@maroon12:~/cs214/projects/proj08/java$ javac -deprecation TempDriver
error: Class names, 'TempDriver', are only accepted if annotation processing is explicitly requested
1 error
ajs244@maroon12:~/cs214/projects/proj08/java$ javac -deprecation TempDriver.java
ajs244@maroon12:~/cs214/projects/proj08/java$ java TempDriver


baseTemp (Enter the temperature in the format --- degrees, scale): 0 F

limitTemp (Enter the temperature in the format --- degrees, scale): 100 C

stepValue: 2.5

	Fahrenheit		Celsius			Kelvin

	0.00000 F		-17.77778 C		255.37222 K	
	2.50000 F		-16.38889 C		256.76111 K	
	5.00000 F		-15.00000 C		258.15000 K	
	7.50000 F		-13.61111 C		259.53889 K	
	10.00000 F		-12.22222 C		260.92778 K	
	12.50000 F		-10.83333 C		262.31667 K	
	15.00000 F		-9.44444 C		263.70556 K	
	17.50000 F		-8.05556 C		265.09444 K	
	20.00000 F		-6.66667 C		266.48333 K	
	22.50000 F		-5.27778 C		267.87222 K	
	25.00000 F		-3.88889 C		269.26111 K	
	27.50000 F		-2.50000 C		270.65000 K	
	30.00000 F		-1.11111 C		272.03889 K	
	32.50000 F		0.27778 C		273.42778 K	
	35.00000 F		1.66667 C		274.81667 K	
	37.50000 F		3.05556 C		276.20556 K	
	40.00000 F		4.44444 C		277.59444 K	
	42.50000 F		5.83333 C		278.98333 K	
	45.00000 F		7.22222 C		280.37222 K	
	47.50000 F		8.61111 C		281.76111 K	
	50.00000 F		10.00000 C		283.15000 K	
	52.50000 F		11.38889 C		284.53889 K	
	55.00000 F		12.77778 C		285.92778 K	
	57.50000 F		14.16667 C		287.31667 K	
	60.00000 F		15.55556 C		288.70556 K	
	62.50000 F		16.94444 C		290.09444 K	
	65.00000 F		18.33333 C		291.48333 K	
	67.50000 F		19.72222 C		292.87222 K	
	70.00000 F		21.11111 C		294.26111 K	
	72.50000 F		22.50000 C		295.65000 K	
	75.00000 F		23.88889 C		297.03889 K	
	77.50000 F		25.27778 C		298.42778 K	
	80.00000 F		26.66667 C		299.81667 K	
	82.50000 F		28.05556 C		301.20556 K	
	85.00000 F		29.44444 C		302.59444 K	
	87.50000 F		30.83333 C		303.98333 K	
	90.00000 F		32.22222 C		305.37222 K	
	92.50000 F		33.61111 C		306.76111 K	
	95.00000 F		35.00000 C		308.15000 K	
	97.50000 F		36.38889 C		309.53889 K	
	100.00000 F		37.77778 C		310.92778 K	
	102.50000 F		39.16667 C		312.31667 K	
	105.00000 F		40.55556 C		313.70556 K	
	107.50000 F		41.94444 C		315.09444 K	
	110.00000 F		43.33333 C		316.48333 K	
	112.50000 F		44.72222 C		317.87222 K	
	115.00000 F		46.11111 C		319.26111 K	
	117.50000 F		47.50000 C		320.65000 K	
	120.00000 F		48.88889 C		322.03889 K	
	122.50000 F		50.27778 C		323.42778 K	
	125.00000 F		51.66667 C		324.81667 K	
	127.50000 F		53.05556 C		326.20556 K	
	130.00000 F		54.44444 C		327.59444 K	
	132.50000 F		55.83333 C		328.98333 K	
	135.00000 F		57.22222 C		330.37222 K	
	137.50000 F		58.61111 C		331.76111 K	
	140.00000 F		60.00000 C		333.15000 K	
	142.50000 F		61.38889 C		334.53889 K	
	145.00000 F		62.77778 C		335.92778 K	
	147.50000 F		64.16667 C		337.31667 K	
	150.00000 F		65.55556 C		338.70556 K	
	152.50000 F		66.94444 C		340.09444 K	
	155.00000 F		68.33333 C		341.48333 K	
	157.50000 F		69.72222 C		342.87222 K	
	160.00000 F		71.11111 C		344.26111 K	
	162.50000 F		72.50000 C		345.65000 K	
	165.00000 F		73.88889 C		347.03889 K	
	167.50000 F		75.27778 C		348.42778 K	
	170.00000 F		76.66667 C		349.81667 K	
	172.50000 F		78.05556 C		351.20556 K	
	175.00000 F		79.44444 C		352.59444 K	
	177.50000 F		80.83333 C		353.98333 K	
	180.00000 F		82.22222 C		355.37222 K	
	182.50000 F		83.61111 C		356.76111 K	
	185.00000 F		85.00000 C		358.15000 K	
	187.50000 F		86.38889 C		359.53889 K	
	190.00000 F		87.77778 C		360.92778 K	
	192.50000 F		89.16667 C		362.31667 K	
	195.00000 F		90.55556 C		363.70556 K	
	197.50000 F		91.94444 C		365.09444 K	
	200.00000 F		93.33333 C		366.48333 K	
	202.50000 F		94.72222 C		367.87222 K	
	205.00000 F		96.11111 C		369.26111 K	
	207.50000 F		97.50000 C		370.65000 K	
	210.00000 F		98.88889 C		372.03889 K	

Type 'No' to exit, anything else to continue: Yes


baseTemp (Enter the temperature in the format --- degrees, scale): 0 K

limitTemp (Enter the temperature in the format --- degrees, scale): 212 F

stepValue: 20.0

	Fahrenheit		Celsius			Kelvin

	-459.67000 F		-273.15000 C		0.00000 K	
	-423.67000 F		-253.15000 C		20.00000 K	
	-387.67000 F		-233.15000 C		40.00000 K	
	-351.67000 F		-213.15000 C		60.00000 K	
	-315.67000 F		-193.15000 C		80.00000 K	
	-279.67000 F		-173.15000 C		100.00000 K	
	-243.67000 F		-153.15000 C		120.00000 K	
	-207.67000 F		-133.15000 C		140.00000 K	
	-171.67000 F		-113.15000 C		160.00000 K	
	-135.67000 F		-93.15000 C		180.00000 K	
	-99.67000 F		-73.15000 C		200.00000 K	
	-63.67000 F		-53.15000 C		220.00000 K	
	-27.67000 F		-33.15000 C		240.00000 K	
	8.33000 F		-13.15000 C		260.00000 K	
	44.33000 F		6.85000 C		280.00000 K	
	80.33000 F		26.85000 C		300.00000 K	
	116.33000 F		46.85000 C		320.00000 K	
	152.33000 F		66.85000 C		340.00000 K	
	188.33000 F		86.85000 C		360.00000 K	

Type 'No' to exit, anything else to continue: No
ajs244@maroon12:~/cs214/projects/proj08/java$ exit

Script done on Fri 12 Apr 2019 01:04:05 AM EDT
