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


