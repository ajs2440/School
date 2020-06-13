Script started on Fri 12 Apr 2019 03:20:30 PM EDT
ajs244@gold24:~/cs214/labs/09/ada$ make 
gnatbind  max.ali
gnatlink  max.ali -o adaMax
ajs244@gold24:~/cs214/labs/09/ada$ ./max

          99          88          77          66          55
          55          66          77          88          99
          55          77          99          88          66
The maximum value in list 1 is          99
The maximum value in list 2 is          99
The maximum value in list 3 is          99

ajs244@gold24:~/cs214/labs/09/ada$ cat *.adb
-- list_package.adb defines Ada linked list operations.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/12/2019
-------------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;

package body List_Package is

  -----------------------------------------------------
  -- Initialize a list                                -
  -- Receive: aList, a List.                          -
  -- Pre: aList is uninitialized.                     -
  -- Post: aList%itsFirst == aList%itsLast == NULL && -
  --        aList%itsLength == 0.                     -
  -----------------------------------------------------
  procedure Init(A_List : out List) is
  begin
    A_List.Its_First := null;
    A_List.Its_Last := null;
    A_List.Its_Length := 0;
  end Init;

  ------------------------------------------------
  -- Is a list empty?                            -
  -- Receive: aList, a List.                     -
  -- Return: true, iff aList contains no values. -
  ------------------------------------------------
  function Empty(A_List : in List) return Boolean is
  begin
    return A_List.Its_Length = 0;
  end Empty;

  -------------------------------------
  -- How many values are in a list?   -
  -- Receive: aList, a List.          -
  -- Return: aList%itsLength.         -
  -------------------------------------
  function Length(A_List : in List) return Integer is
  begin
    return A_List.Its_Length;
  end Length;

  ----------------------------------------
  -- Append a value to a list.           -
  -- Receive: aValue, an integer,        -
  -- Passback: aList, containing aValue. -
  ----------------------------------------
  procedure Append(A_Value : in Integer; A_List : in out List) is
    Temp_Ptr : constant Node_Ptr := new List_Node;
  begin
    Temp_Ptr.Its_Value := A_Value;
    Temp_Ptr.Its_Next := null;

    if A_List.Its_Length = 0 then
       A_List.Its_First := Temp_Ptr;
    else
       A_List.Its_Last.Its_Next := Temp_Ptr;
    end if;

    A_List.Its_Last := Temp_Ptr;

    A_List.Its_Length := A_List.Its_Length + 1;
  end Append;

  -------------------------------------
  -- Display the values in a list.    -
  -- Receive: aList, a List.          -
  -- Output: the values in aList.     -
  -------------------------------------

  procedure Put(A_List : in List) is
    Temp_Ptr : Node_Ptr := A_List.Its_First;
  begin 
    while Temp_Ptr /= null loop
      Put(' '); Put(Temp_Ptr.Its_Value);
      Temp_Ptr := Temp_Ptr.Its_Next;
    end loop;
  end Put;

  ---------------------------------------
  -- Find the maximum value in a list.  -
  -- Receive: aList, a List.            -
  -- Return: the maximum value in aList.-
  ---------------------------------------

  function Max(A_List : in List) return Integer is
    Temp_Ptr : Node_Ptr := A_List.Its_First;
    Max_Value : Integer := -999999;
  begin 
    while Temp_Ptr /= null loop
      if Temp_Ptr.Its_Value > Max_Value then
        Max_Value := Temp_Ptr.Its_Value;
      end if;
      Temp_Ptr := Temp_Ptr.Its_Next;
    end loop;
    return Max_Value;
  end Max;

end List_Package;

-- max.adb finds the max of a list of integers. 
-- 
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/12/2019
-------------------------------------------------- 
 
with Ada.Text_IO, Ada.Integer_Text_IO, List_Package; 
use Ada.Text_IO, Ada.Integer_Text_IO, List_Package; 
 
procedure Max is 
                              -- define 3 lists 
  List1, List2, List3 : List;
  -- My_Ptr : Node_Ptr;
 
begin 
  Init(List1);                -- initialize them 
  Init(List2); 
  Init(List3); 
 
  Append(99, List1);          -- 99, 88, 77, 66, 55 
  Append(88, List1);          -- max is first 
  Append(77, List1); 
  Append(66, List1); 
  Append(55, List1); 
 
  Append(55, List2);          -- 55, 66, 77, 88, 99 
  Append(66, List2);          -- max is last 
  Append(77, List2); 
  Append(88, List2); 
  Append(99, List2); 
 
  Append(55, List3);          -- 55, 77, 99, 88, 66 
  Append(77, List3);          -- max is in the middle 
  Append(99, List3); 
  Append(88, List3); 
  Append(66, List3); 
  
  New_Line; 
  Put(List1); New_Line;       -- output the 3 lists 
  Put(List2); New_Line; 
  Put(List3); New_Line; 
                              -- display their maxima 
  Put("The maximum value in list 1 is ");  
  Put( Max(List1) ); 
  New_Line; 
  Put("The maximum value in list 2 is "); 
  Put( Max(List2) );
  New_Line; 
  Put("The maximum value in list 3 is ");
  Put( Max(List3) );
  New_Line;
  -- My_Ptr := List1.Its_First;
  -- Put ( My_Ptr );
  New_Line;  
 
end Max; 

ajs244@gold24:~/cs214/labs/09/ada$ exit

Script done on Fri 12 Apr 2019 03:21:20 PM EDT
