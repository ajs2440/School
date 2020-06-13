-- names.adb "test-drives" the Name type.
-- Begun by: Prof. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/02/2019
----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

procedure names is

  NAME_SIZE : constant Integer := 8;

  type Name is
    record
      MyFirst, MyMiddle, MyLast : String( 1..NAME_SIZE );
    end record;

  aName : Name ;


  ----------------------------------------------
  -- Init initializes a Name variable          -
  -- Receive: theName, the Name variable;      -
  --          First, the first name;           -
  --          Middle, the middle name;         -
  --          Last, the last name.             -
  -- Return: theName, its fields set to First, -
  --               Middle, and Last.           -
  ----------------------------------------------

  procedure Init (TheName : out Name; First, Middle, Last : in String) is
  begin
    TheName.MyFirst := First;
    TheName.MyMiddle := Middle;
    TheName.MyLast := Last;
  end Init;

  ----------------------------------------------
  -- getFirst(Name) retrieves Name.MyFirst     -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myFirst.                  -
  ----------------------------------------------

  function getFirst(TheName : in Name) return String is
  begin
    return TheName.MyFirst;
  end getFirst;

  ----------------------------------------------
  -- project 7 method
  -- setFirst(String) sets Name.MyFirst        -
  -- Receive: First, a String.                 -
  -- PRE: Valid String passed as first name.   -
  -- POST: set MyFirst equal to First.         -
  ----------------------------------------------

  procedure setFirst(TheName : in out Name; First : in String) is
  begin
    TheName.MyFirst := First;
  end setFirst;

  ----------------------------------------------
  -- getMiddle(Name) retrieves Name.MyMiddle   -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myMiddle.                 -
  ----------------------------------------------

  function getMiddle(TheName : in Name) return String is
  begin
    return TheName.MyMiddle;
  end getMiddle;

  ----------------------------------------------
  -- setMiddle(String) sets Name.MyMiddle      -
  -- Receive: Middle, a String.                -
  -- PRE: Valid String passed as middle name.  -
  -- POST: set MyMiddle equal to Middle.       -
  ----------------------------------------------

  procedure setMiddle(TheName : in out Name; Middle: in String) is
  begin
    TheName.MyMiddle := Middle;
  end setMiddle;

  ----------------------------------------------
  -- getLast(Name) retrieves Name.MyLast       -
  -- Receive: theName, a Name.                 -
  -- PRE: theName has been initialized.        -
  -- Return: theName.myLast.                   -
  ----------------------------------------------

  function getLast(TheName : in Name) return String is
  begin
    return TheName.MyLast;
  end getLast;

  ----------------------------------------------
  -- setLast(String) sets Name.MyLast          -
  -- Receive: Last, a String.                  -
  -- PRE: Valid String passed as last name.    -
  -- POST: set MyLast equal to Last.           -
  ----------------------------------------------

  procedure setLast(TheName : in out Name; Last : in String) is
  begin
    TheName.MyLast := Last;
  end setLast;

  -----------------------------------------------
  -- getFullName(Name) retrieves Name as a String-
  -- Receive: theName, a Name.                  -
  -- PRE: theName has been initialized.         -
  -- Return: a String representation of theName -
  -----------------------------------------------

  function getFullName(TheName : in Name) return String is
  begin
    return getFirst(aName) & " " & getMiddle(aName) & " " & getLast(aName);
  end getFullName;

  ----------------------------------------------
  -- Put(Name) displays a Name value.          -
  -- PRE: theName has been initialized.        -
  -- Receive: theName, a Name.                 -
  -- Output: theName, to the screen.           -
  ----------------------------------------------

  procedure Put(TheName : in Name) is
  begin
    Put ( getFullName(aName) );
  end Put;

  -----------------------------------------------
  -- lfmi(Name) retrieves Name as a String      -
  -- Receive: theName, a Name.                  -
  -- PRE: theName has been initialized.         -
  -- Return: a String representation of theName -
  -----------------------------------------------

  function lfmi(TheName : in Name) return String is
  begin
    return getLast(aName) & ", " & getFirst(aName) & " " & TheName.MyMiddle(1) & ".";
  end lfmi;

  ----------------------------------------------------------------------
  -- read(Name, String) reads inputs and populates a Name object.      -
  -- Receive: TheName, a Name; First, Middle, Last, Strings            -
  -- POST: Valid name inputs read from user input and                  -
  --       Name object filled with input values for
  --       first, middle, and last names.                              -
  ----------------------------------------------------------------------

  procedure read(TheName : in out Name) is
  First, Middle, Last: String(1 .. 8) := (others => ' ');
  Finish: Integer;
  begin
    Get_Line (First, Finish);
    setFirst(TheName, First);

    Get_Line (Middle, Finish);
    setMiddle(TheName, Middle);

    Get_Line (Last, Finish);
    setLast(TheName, Last);    
  end read;


begin
  Init(aName, "John    ", "Paul    ", "Jones   ");

  pragma Assert( getFirst(aName) = "John    ", "getFirst() failed");
  pragma Assert( getMiddle(aName) = "Paul    ", "getMiddle() failed");
  pragma Assert( getLast(aName) = "Jones   ", "getLast() failed");
  pragma Assert( getFullName(aName) = "John     Paul     Jones   ", 
                   "getFullName() failed");

  Put(aName); New_line;

  ------ PROJECT 7 METHODS' TESTS ------

  -- setFirst() test
  setFirst(aName, "Jake    ");
  pragma Assert( getFirst(aName) = "Jake    ", "setFirst() failed");

  -- setMiddle() test
  setMiddle(aName, "Joseph  ");
  pragma Assert( getMiddle(aName) = "Joseph  ", "setMiddle() failed");

  -- setLast() test
  setLast(aName, "Paul    ");
  pragma Assert( getLast(aName) = "Paul    ", "setLast() failed");

  -- lfmi() test
  pragma Assert( lfmi(aName) = "Paul    , Jake     J.", "lfmi() failed");

  -- read() test
  read(aName);
  pragma Assert( getFirst(aName) = "Dawson  ", "read() failed");
  pragma Assert( getMiddle(aName) = "Alex    ", "read() failed");
  pragma Assert( getLast(aName) = "Buist   ", "read() failed");
  Put(aName); New_line;

  Put("All tests passed!"); New_line;

end names;

