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
