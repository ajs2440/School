Script started on Fri 12 Apr 2019 01:00:29 AM EDT
ajs244@maroon12:~/cs214/projects/proj08/ada$ cat *.ads *.adb
-- Temperature.ads declares the Temperature type and its operations.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/10/2019
--------------------------------------------------------------

package Temp_Package is

  -------------- PUBLIC SECTION --------------

  type Temperature is private; 

  ----------------------------------------------
  -- isValid() checks whether a Temperature type is valid          
  -- Receive: degrees, myDegree Float;
  --          scale, myScale Character.         
  -- Return: true if Temperature type is valid, false otherwise.     
  ----------------------------------------------

  function isValid(degrees: in Float; scale: in Character) return Boolean;

  ----------------------------------------------
  -- Init initializes a Temperature variable          
  -- Receive: degrees, myDegree Float;
  --          scale, myScale Character.         
  -- Return: Temp, its fields set to degrees
  --         and scale.     
  ----------------------------------------------

  procedure Init(Temp: out Temperature; degrees: in Float; scale: in Character);

  ----------------------------------------------
  -- getMyDegree retrieves Temperature.myDegree        
  -- Receive: Temp, a Temperature.                      
  -- PRE: Temp has been initialized.            
  -- Return: Temp.myDegree.                     
  ----------------------------------------------
  function getMyDegree(Temp: in Temperature) return Float;

  ----------------------------------------------
  -- getMyScale retrieves Temperature.myScale 
  -- Receive: Temp, a Temperature.        
  -- PRE: Temp has been initialized.
  -- Return: Temp.myScale. 
  ----------------------------------------------
  function getMyScale(Temp: in Temperature) return Character;

  -------------------------------------------------------------
  -- getInF gives a Temperature in equivalent degrees F scale -
  -- PRE: Temperature object which this message is sent to has-
  --      been initialized.                                   -
  -- Receive: Temp, a Temperature.                            -
  -- Return: a Temperature object in degrees F scale.         -
  -------------------------------------------------------------
  procedure getInF(temp1: in Temperature; temp2: out Temperature);

  -------------------------------------------------------------
  -- getInC gives a Temperature in equivalent degrees C scale -
  -- PRE: Temperature object which this message is sent to has-
  --      been initialized.                                   -
  -- Receive: Temp, a Temperature.                            -
  -- Return: a Temperature object in degrees C scale.         -
  -------------------------------------------------------------
  procedure getInC(temp1: in Temperature; temp2: out Temperature);

  -------------------------------------------------------------
  -- getInK gives a Temperature in equivalent degrees K scale -
  -- PRE: Temperature object which this message is sent to has-
  --      been initialized.                                   -
  -- Receive: Temp, a Temperature.                            -
  -- Return: a Temperature object in degrees K scale.         -
  -------------------------------------------------------------
  procedure getInK(temp1: in Temperature; temp2: out Temperature);

  -------------------------------------------------------------
  -- readTemp reads Temperature object values from input.     - 
  -- PRE: Temp has been initialized.                          -
  -- Receive: Temp, a Temperature.                            -
  -------------------------------------------------------------
  procedure readTemp(Temp: in out Temperature);

  -------------------------------------------------------------
  -- displayTemp outputs Temperature object values.           - 
  -- PRE: Temp has been initialized.                          -
  -- Receive: Temp, a Temperature.                            -
  -- Output: Temp.myDegree & Temp.myScale output to console.  -
  -------------------------------------------------------------
  procedure displayTemp(Temp: in out Temperature);

  -------------------------------------------------------------
  -- raiseTemp raises myDegree by degrees amount.             - 
  -- PRE: Temp has been initialized, degrees > 0.             -
  -- Receive: Temp, a Temperature;                            -
  --          degrees, a Float                                -
  -- Return: Temperature object with raised myDegree.         -
  -------------------------------------------------------------
  procedure raiseTemp(temp1: in Temperature; degrees: in Float; temp2: out Temperature);

  -------------------------------------------------------------
  -- lower lowers myDegree by degrees amount.                 - 
  -- PRE: Temp has been initialized, degrees > 0.             -
  -- Receive: Temp, a Temperature;                            -
  --          degrees, a Float                                -
  -- Return: Temperature object with lowered myDegree.        -
  -------------------------------------------------------------
  procedure lower(temp1: in Temperature; degrees: in Float; temp2: out Temperature);

  -------------------------------------------------------------
  -- "=" compares the degrees of two Temperature objects      - 
  -- PRE: both temp1 and temp2 have been initialized.         -
  -- Receive: temp1, a Temperature;                           -
  --          temp2, a Temperature.                           -
  -- Return: true if they have equaivalent degrees, false     -
  --         otherwise.                                       -
  -------------------------------------------------------------
  function equals(temp1, temp2: in Temperature) return Boolean;

  -------------------------------------------------------------
  -- "<" compares the degrees of two Temperature objects      - 
  -- PRE: both temp1 and temp2 have been initialized.         -
  -- Receive: temp1, a Temperature;                           -
  --          temp2, a Temperature.                           -
  -- Return: true if temp1 is less than temp2, false otherwise-
  -------------------------------------------------------------
  function lessThan(temp1, temp2: in Temperature) return Boolean;

  -------------- PRIVATE SECTION --------------

  private 

  type Temperature is
      record
         myDegree : Float;
         myScale : Character;
      end record; 

end Temp_Package;
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

-- temp_package.adb defines operations for the Temperature type.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/10/2019
---------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

package body Temp_Package is

  ----------------------------------------------
  -- isValid() checks whether a Temperature type is valid          
  -- Receive: degrees, myDegree Float;
  --          scale, myScale Character.         
  -- Return: true if Temperature type is valid, false otherwise.     
  ----------------------------------------------
  function isValid(degrees: in Float; scale: in Character) return Boolean is
  begin

    if scale = 'F' or scale = 'f' then
      if degrees < -459.67 then
        Put ("Invalid Fahrenheit Degree");
        return false;
      else
        return true;
      end if;
      elsif scale = 'C' or scale = 'c' then
      if degrees < -273.15 then
        Put ("Invalid Celsius Degree");
        return false;
      else
        return true;
      end if;
      elsif scale = 'K' or scale = 'k' then
      if degrees < 0.0 then
        Put ("Invalid Kelvin Degree");
        return false;
      else
        return true;
      end if; 
    else
      Put ("Invalid Input");
      return false;
    end if;
      
  end isValid;

  ----------------------------------------------
  -- Init initializes a Temperature variable          
  -- Receive: degrees, myDegree Float;
  --          scale, myScale Character.         
  -- Return: Temp, its fields set to degrees
  --         and scale.     
  ----------------------------------------------
  procedure Init(Temp: out Temperature; degrees: in Float; scale: in Character) is
  begin

    if isValid(degrees, scale) then
      Temp.myDegree := degrees;
      Temp.myScale := scale;
    end if;

  end Init;

  ----------------------------------------------
  -- getMyDegree retrieves Temperature.myDegree        
  -- Receive: Temp, a Temperature.                      
  -- PRE: Temp has been initialized.            
  -- Return: Temp.myDegree.                     
  ----------------------------------------------
  function getMyDegree(Temp: in Temperature) return Float is 
  begin
    return Temp.myDegree;
  end getMyDegree;

  ----------------------------------------------
  -- getMyScale retrieves Temperature.myScale 
  -- Receive: Temp, a Temperature.        
  -- PRE: Temp has been initialized.
  -- Return: Temp.myScale. 
  ----------------------------------------------
  function getMyScale(Temp: in Temperature) return Character is 
  begin
    return Temp.myScale;
  end getMyScale;

  -------------------------------------------------------------
  -- getInF gives a Temperature in equivalent degrees F scale -
  -- PRE: Temperature object which this message is sent to has-
  --      been initialized.                                   -
  -- Receive: Temp, a Temperature.                            -
  -- Return: a Temperature object in degrees F scale.         -
  -------------------------------------------------------------
  procedure getInF(temp1: in Temperature; temp2: out Temperature) is
  degreeF : Float := 0.0;
  begin
    if getMyScale(temp1) = 'F' or getMyScale(temp1) = 'f' then
      Init(temp2, getMyDegree(temp1), 'F');
    else
      if getMyScale(temp1) = 'C' or getMyScale(temp1) = 'c' then
        degreeF := ((9.0/5.0) * getMyDegree(temp1)) + 32.0;
      else
        degreeF := ((getMyDegree(temp1) - 273.15) * (9.0/5.0)) + 32.0;
      end if;

      Init(temp2, degreeF, 'F');
    end if; 

  end getInF;

  -------------------------------------------------------------
  -- getInC gives a Temperature in equivalent degrees C scale -
  -- PRE: Temperature object which this message is sent to has-
  --      been initialized.                                   -
  -- Receive: Temp, a Temperature.                            -
  -- Return: a Temperature object in degrees C scale.         -
  -------------------------------------------------------------
  procedure getInC(temp1: in Temperature; temp2: out Temperature) is
  degreeC : Float := 0.0;
  begin
    if getMyScale(temp1) = 'C' or getMyScale(temp1) = 'c' then
      Init(temp2, getMyDegree(temp1), 'C');
    else
      if getMyScale(temp1) = 'F' or getMyScale(temp1) = 'f' then
        degreeC := (5.0/9.0) * (getMyDegree(temp1) - 32.0);
      else
        degreeC := getMyDegree(temp1) - 273.15;
      end if;

      Init(temp2, degreeC, 'C');
    end if; 
    
  end getInC;

  -------------------------------------------------------------
  -- getInK gives a Temperature in equivalent degrees K scale -
  -- PRE: Temperature object which this message is sent to has-
  --      been initialized.                                   -
  -- Receive: Temp, a Temperature.                            -
  -- Return: a Temperature object in degrees K scale.         -
  -------------------------------------------------------------
  procedure getInK(temp1: in Temperature; temp2: out Temperature) is
  degreeK : Float := 0.0;
  begin
    if getMyScale(temp1) = 'K' or getMyScale(temp1) = 'k' then
      Init(temp2, getMyDegree(temp1), 'K');
    else
      if getMyScale(temp1) = 'F' or getMyScale(temp1) = 'f' then
        degreeK := (5.0/9.0) * (getMyDegree(temp1) + 459.67);
      else
        degreeK := getMyDegree(temp1) + 273.15;
      end if;

      Init(temp2, degreeK, 'K');
    end if; 
    
  end getInK;

  -------------------------------------------------------------
  -- readTemp reads Temperature object values from input.     - 
  -- PRE: Temp has been initialized.                          -
  -- Receive: Temp, a Temperature.                            -
  -------------------------------------------------------------
  procedure readTemp(Temp: in out Temperature) is
  EMPTY_STRING : String := " ";
  degree : Float;
  scale : Character;
  begin
    Put ("(Enter the temperature in the format --- degrees, scale): ");
    Get(degree);
    Get(EMPTY_STRING);
    Get(scale);
    if isValid(degree, scale) then
      Init(Temp, degree, scale);
    end if;
  end readTemp;

  -------------------------------------------------------------
  -- displayTemp outputs Temperature object values.           - 
  -- PRE: Temp has been initialized.                          -
  -- Receive: Temp, a Temperature.                            -
  -- Output: Temp.myDegree & Temp.myScale output to console.  -
  -------------------------------------------------------------
  procedure displayTemp(Temp: in out Temperature) is
  begin
    Put (getMyDegree(Temp), 10, 5, 0);
    Put (" ");
    Put (getMyScale(Temp));
  end displayTemp;

  -------------------------------------------------------------
  -- raiseTemp raises myDegree by degrees amount.             - 
  -- PRE: Temp has been initialized, degrees > 0.             -
  -- Receive: Temp, a Temperature;                            -
  --          degrees, a Float                                -
  -- Return: Temperature object with raised myDegree.         -
  -------------------------------------------------------------
  procedure raiseTemp(temp1: in Temperature; degrees: in Float; temp2: out Temperature) is
  begin
    if degrees > 0.0 then
      Init(temp2, getMyDegree(temp1) + degrees, getMyScale(temp1));
    else
      Put_Line("Please enter a degree greater than 0 to raise the temperature by!");
      Init(temp2, getMyDegree(temp1), getMyScale(temp1));
    end if;
  end raiseTemp;

  -------------------------------------------------------------
  -- lower lowers myDegree by degrees amount.                 - 
  -- PRE: Temp has been initialized, degrees > 0.             -
  -- Receive: Temp, a Temperature;                            -
  --          degrees, a Float                                -
  -- Return: Temperature object with lowered myDegree.        -
  -------------------------------------------------------------
  procedure lower(temp1: in Temperature; degrees: in Float; temp2: out Temperature) is
  begin
    if degrees > 0.0 then
      if isValid(getMyDegree(temp1) - degrees, getMyScale(temp1)) then
        Init(temp2, getMyDegree(temp1) - degrees, getMyScale(temp1));
      else
        Init(temp2, getMyDegree(temp1), getMyScale(temp1));
      end if;
    else
      Put_Line("Please enter a degree greater than 0 to raise the temperature by!");
      Init(temp2, getMyDegree(temp1), getMyScale(temp1));
    end if;
  end lower;

  -------------------------------------------------------------
  -- equals compares the degrees of two Temperature objects   - 
  -- PRE: both temp1 and temp2 have been initialized.         -
  -- Receive: temp1, a Temperature;                           -
  --          temp2, a Temperature.                           -
  -- Return: true if they have equaivalent degrees, false     -
  --         otherwise.                                       -
  -------------------------------------------------------------
  function equals(temp1, temp2: in Temperature) return Boolean is
  myTemp : Temperature;
  begin
    if getMyScale(temp1) = getMyScale(temp2) and getMyDegree(temp1) = getMyDegree(temp2) then
      return true;
    else
      if getMyScale(temp1) = 'F' or getMyScale(temp1) = 'f' then
        getInF(temp2, myTemp);
        return getMyDegree(temp1) = getMyDegree(myTemp);
      elsif getMyScale(temp1) = 'C' or getMyScale(temp1) = 'c' then
        getInC(temp2, myTemp);
        return getMyDegree(temp1) = getMyDegree(myTemp);
      elsif getMyScale(temp1) = 'K' or getMyScale(temp1) = 'k' then
        getInK(temp2, myTemp);
        return getMyDegree(temp1) = getMyDegree(myTemp);
      else
        return false;
      end if;
    end if;
  end equals;

  -------------------------------------------------------------
  -- lessThan compares the degrees of two Temperature objects - 
  -- PRE: both temp1 and temp2 have been initialized.         -
  -- Receive: temp1, a Temperature;                           -
  --          temp2, a Temperature.                           -
  -- Return: true if temp1 is less than temp2, false otherwise-
  -------------------------------------------------------------
  function lessThan(temp1, temp2: in Temperature) return Boolean is
  myTemp : Temperature;
  begin 
    if getMyScale(temp1) = getMyScale(temp2) and getMyDegree(temp1) < getMyDegree(temp2) then
      return true;
    else
      if getMyScale(temp1) = 'F' or getMyScale(temp1) = 'f' then
        getInF(temp2, myTemp);
        return getMyDegree(temp1) < getMyDegree(myTemp);
      elsif getMyScale(temp1) = 'C' or getMyScale(temp1) = 'c' then
        getInC(temp2, myTemp);
        return getMyDegree(temp1) < getMyDegree(myTemp);
      elsif getMyScale(temp1) = 'K' or getMyScale(temp1) = 'k' then
        getInK(temp2, myTemp);
        return getMyDegree(temp1) < getMyDegree(myTemp);
      else
        return false;
      end if;
    end if;
  end lessThan;

end Temp_Package;
ajs244@maroon12:~/cs214/projects/proj08/ada$ gnatmakte  e temp_drier  ver.adb
gnatmake: "temp_driver" up to date.
ajs244@maroon12:~/cs214/projects/proj08/ada$ ./temp_driver

baseTemp (Enter the temperature in the format --- degrees, scale): 0 F
limitTemp (Enter the temperature in the format --- degrees, scale): 100 C
stepValue: 2.5

         Fahrenheit         Celsius         Kelvin         

         0.00000 F       -17.77778 C       255.37224 K
         2.50000 F       -16.38889 C       256.76114 K
         5.00000 F       -15.00000 C       258.15002 K
         7.50000 F       -13.61111 C       259.53891 K
        10.00000 F       -12.22222 C       260.92780 K
        12.50000 F       -10.83333 C       262.31668 K
        15.00000 F        -9.44444 C       263.70557 K
        17.50000 F        -8.05556 C       265.09445 K
        20.00000 F        -6.66667 C       266.48337 K
        22.50000 F        -5.27778 C       267.87225 K
        25.00000 F        -3.88889 C       269.26114 K
        27.50000 F        -2.50000 C       270.65002 K
        30.00000 F        -1.11111 C       272.03891 K
        32.50000 F         0.27778 C       273.42780 K
        35.00000 F         1.66667 C       274.81668 K
        37.50000 F         3.05556 C       276.20557 K
        40.00000 F         4.44444 C       277.59445 K
        42.50000 F         5.83333 C       278.98337 K
        45.00000 F         7.22222 C       280.37225 K
        47.50000 F         8.61111 C       281.76114 K
        50.00000 F        10.00000 C       283.15002 K
        52.50000 F        11.38889 C       284.53894 K
        55.00000 F        12.77778 C       285.92783 K
        57.50000 F        14.16667 C       287.31671 K
        60.00000 F        15.55556 C       288.70560 K
        62.50000 F        16.94444 C       290.09448 K
        65.00000 F        18.33333 C       291.48337 K
        67.50000 F        19.72222 C       292.87225 K
        70.00000 F        21.11111 C       294.26114 K
        72.50000 F        22.50000 C       295.65002 K
        75.00000 F        23.88889 C       297.03894 K
        77.50000 F        25.27778 C       298.42783 K
        80.00000 F        26.66667 C       299.81671 K
        82.50000 F        28.05556 C       301.20560 K
        85.00000 F        29.44445 C       302.59448 K
        87.50000 F        30.83333 C       303.98337 K
        90.00000 F        32.22223 C       305.37225 K
        92.50000 F        33.61111 C       306.76114 K
        95.00000 F        35.00000 C       308.15002 K
        97.50000 F        36.38889 C       309.53894 K
       100.00000 F        37.77778 C       310.92783 K
       102.50000 F        39.16667 C       312.31671 K
       105.00000 F        40.55556 C       313.70560 K
       107.50000 F        41.94445 C       315.09448 K
       110.00000 F        43.33334 C       316.48337 K
       112.50000 F        44.72223 C       317.87225 K
       115.00000 F        46.11111 C       319.26114 K
       117.50000 F        47.50000 C       320.65005 K
       120.00000 F        48.88889 C       322.03894 K
       122.50000 F        50.27778 C       323.42783 K
       125.00000 F        51.66667 C       324.81671 K
       127.50000 F        53.05556 C       326.20560 K
       130.00000 F        54.44445 C       327.59448 K
       132.50000 F        55.83334 C       328.98337 K
       135.00000 F        57.22223 C       330.37225 K
       137.50000 F        58.61111 C       331.76114 K
       140.00000 F        60.00000 C       333.15005 K
       142.50000 F        61.38889 C       334.53894 K
       145.00000 F        62.77778 C       335.92783 K
       147.50000 F        64.16667 C       337.31671 K
       150.00000 F        65.55556 C       338.70560 K
       152.50000 F        66.94445 C       340.09448 K
       155.00000 F        68.33334 C       341.48337 K
       157.50000 F        69.72223 C       342.87225 K
       160.00000 F        71.11111 C       344.26114 K
       162.50000 F        72.50000 C       345.65005 K
       165.00000 F        73.88889 C       347.03894 K
       167.50000 F        75.27778 C       348.42783 K
       170.00000 F        76.66667 C       349.81671 K
       172.50000 F        78.05556 C       351.20560 K
       175.00000 F        79.44445 C       352.59448 K
       177.50000 F        80.83334 C       353.98337 K
       180.00000 F        82.22223 C       355.37225 K
       182.50000 F        83.61111 C       356.76114 K
       185.00000 F        85.00001 C       358.15005 K
       187.50000 F        86.38889 C       359.53894 K
       190.00000 F        87.77778 C       360.92783 K
       192.50000 F        89.16667 C       362.31671 K
       195.00000 F        90.55556 C       363.70560 K
       197.50000 F        91.94445 C       365.09448 K
       200.00000 F        93.33334 C       366.48337 K
       202.50000 F        94.72223 C       367.87225 K
       205.00000 F        96.11111 C       369.26114 K
       207.50000 F        97.50001 C       370.65005 K
       210.00000 F        98.88889 C       372.03894 K

Type 'No' to exit, any other two-lettered word to continue: Ye

baseTemp (Enter the temperature in the format --- degrees, scale): 0 K
limitTemp (Enter the temperature in the format --- degrees, scale): 212 F
stepValue: 20.0

         Fahrenheit         Celsius         Kelvin         

      -459.66998 F      -273.14999 C         0.00000 K
      -423.66998 F      -253.14999 C        20.00000 K
      -387.66998 F      -233.14999 C        40.00000 K
      -351.66998 F      -213.14999 C        60.00000 K
      -315.66998 F      -193.14999 C        80.00000 K
      -279.66998 F      -173.14999 C       100.00000 K
      -243.66998 F      -153.14999 C       120.00000 K
      -207.66998 F      -133.14999 C       140.00000 K
      -171.66998 F      -113.14999 C       160.00000 K
      -135.66998 F       -93.14999 C       180.00000 K
       -99.66998 F       -73.14999 C       200.00000 K
       -63.66998 F       -53.14999 C       220.00000 K
       -27.66999 F       -33.14999 C       240.00000 K
         8.33001 F       -13.14999 C       260.00000 K
        44.33001 F         6.85001 C       280.00000 K
        80.33001 F        26.85001 C       300.00000 K
       116.33001 F        46.85001 C       320.00000 K
       152.33002 F        66.85001 C       340.00000 K
       188.33000 F        86.85001 C       360.00000 K

Type 'No' to exit, any other two-lettered word to continue: No

ajs244@maroon12:~/cs214/projects/proj08/ada$ exit

Script done on Fri 12 Apr 2019 01:02:04 AM EDT
