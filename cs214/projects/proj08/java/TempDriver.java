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
