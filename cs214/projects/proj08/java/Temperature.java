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

