-- temp_driver.adb "test-drives" the Temperature type.
--
-- Begun by: Dr. Adams, CPSC 280, October 1999.
-- Completed by: Advait Scaria
-- Date: 04/10/2019
----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Temp_Package; use Temp_Package;

procedure temp_driver is

baseTemp : Temp_Package.Temperature;
limitTemp : Temp_Package.Temperature;
myTemp : Temp_Package.Temperature;
stepValue : Float;
input: String := "  ";

begin
  Until_Loop:
  loop
     Put_Line("");
     Put ("baseTemp ");
     readTemp(baseTemp);
     Init(myTemp, getMyDegree(baseTemp), getMyScale(baseTemp));

     Put ("limitTemp ");
     readTemp(limitTemp);

     Put ("stepValue: ");
     Get(stepValue);

     New_Line;
     Put("         ");
     Put("Fahrenheit");
     Put("         ");
     Put("Celsius");
     Put("         ");
     Put("Kelvin");
     Put("         ");
     New_Line;
     New_Line;

     while lessThan(baseTemp, limitTemp) loop
      getInF(baseTemp, myTemp);
      displayTemp(myTemp);
      getInC(baseTemp, myTemp);
      displayTemp(myTemp);
      getInK(baseTemp, myTemp);
      displayTemp(myTemp);
      New_Line;
      raiseTemp(baseTemp, stepValue, baseTemp);
     end loop;

     New_Line;
     Put("Type 'No' to exit, any other two-lettered word to continue: ");
     Get(input);
     exit Until_Loop when input = "No"; 

  end loop Until_Loop;

end temp_driver;

