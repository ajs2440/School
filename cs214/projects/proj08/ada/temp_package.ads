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
