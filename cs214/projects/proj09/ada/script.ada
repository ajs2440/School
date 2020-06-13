Script started on Tue 23 Apr 2019 08:26:35 PM EDT
ajs244@gold09:~/cs214/projects/proj09/ada$ cat search      *.adb *.ads
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

  ---------------------------------------------------
  -- Find the position of a given value in a list.  -
  -- Receive: aList, a list of integers; and        -
  --          aValue, an integer.                   -
  -- Return: the position of aValue within aList, if-
  --         aValue is present in aList; -1,        - 
  --         otherwise.                             -
  ---------------------------------------------------

  function Search(A_List : in List; A_Value: in Integer) return Integer is
    Temp_Ptr : Node_Ptr := A_List.Its_First;
    Counter : Integer := 0;
  begin 
    while Temp_Ptr /= null loop
      if Temp_Ptr.Its_Value = A_Value then
        return Counter;
      end if;
      Temp_Ptr := Temp_Ptr.Its_Next;
      Counter := Counter + 1;
    end loop;
    return -1;
  end Search;

end List_Package;

-- searchlist.adb tests the search subprogram given a linked list. 
-- 
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/23/2019
-------------------------------------------------- 
 
with Ada.Text_IO, Ada.Integer_Text_IO, List_Package; 
use Ada.Text_IO, Ada.Integer_Text_IO, List_Package; 
 
procedure searchlist is 
                              -- define 4 lists 
  List1, List2, List3, List4: List;
  -- My_Ptr : Node_Ptr;
 
begin 
  Init(List1);                -- initialize them 
  Init(List2); 
  Init(List3);
  Init(List4); 
 
  Append(99, List1);          -- 99 is first, should return 0
  Append(88, List1);          
  Append(77, List1); 
  Append(66, List1); 
  Append(55, List1); 
 
  Append(55, List2);          -- 99 is last, should return 4
  Append(66, List2);          
  Append(77, List2); 
  Append(88, List2); 
  Append(99, List2); 
 
  Append(55, List3);          -- 99 is in middle, should return 2
  Append(77, List3);          
  Append(99, List3); 
  Append(88, List3); 
  Append(66, List3); 

  Append(5, List4);          -- 99 is not present, should return -1
  Append(6, List4);          
  Append(7, List4); 
  Append(8, List4); 
  Append(9, List4); 
  
  New_Line; 
  Put("list1: "); Put(List1); New_Line;       -- output the 4 lists 
  Put("list2: "); Put(List2); New_Line; 
  Put("list3: "); Put(List3); New_Line;
  Put("list4: "); Put(List4); New_Line; 
                              -- display the position of 99 
  New_Line;
  Put("Position of 99 in List1: ");  
  Put( Search(List1, 99) ); 
  New_Line;
  Put("Position of 99 in List2: ");  
  Put( Search(List2, 99) ); 
  New_Line;
  Put("Position of 99 in List3: ");  
  Put( Search(List3, 99) ); 
  New_Line;
  Put("Position of 99 in List4: ");  
  Put( Search(List4, 99) ); 
  New_Line; 
  -- My_Ptr := List1.Its_First;
  -- Put ( My_Ptr );
  New_Line;  
 
end searchlist; 

-- list_package.ads declares an Ada linked list and its operations.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/12/2019
------------------------------------------------------------------

package List_Package is

  -- the list-type itself (public)
  type List is private;

  -----------------------------------------------------
  -- Initialize a list                                -
  -- Receive: aList, a List.                          -
  -- Pre: aList is uninitialized.                     -
  -- Post: aList%itsFirst == aList%itsLast == NULL && -
  --        aList%itsLength == 0.                     -
  -----------------------------------------------------
  procedure Init(A_List: out List);


  ------------------------------------------------
  -- Is a list empty?                            -
  -- Receive: aList, a List.                     -
  -- Return: true, iff aList contains no values. -
  ------------------------------------------------
  function Empty(A_List: in List) return Boolean;

  -------------------------------------
  -- How many values are in a list?   -
  -- Receive: aList, a List.          -
  -- Return: aList%itsLength.         -
  -------------------------------------
  function Length(A_List : in List) return Integer;


  ----------------------------------------
  -- Append a value to a list.           -
  -- Receive: aValue, an integer,        -
  -- Passback: aList, containing aValue. -
  ----------------------------------------
  procedure Append(A_Value : in Integer; A_List: in out List);


  -------------------------------------
  -- Display the values in a list.    -
  -- Receive: aList, a List.          -
  -- Output: the values in aList.     -
  -------------------------------------

  procedure Put(A_List : in List);

  ---------------------------------------
  -- Find the maximum value in a list.  -
  -- Receive: aList, a List.            -
  -- Return: the maximum value in aList.-
  ---------------------------------------

  function Max(A_List : in List) return Integer;

  ---------------------------------------------------
  -- Find the position of a given value in a list.  -
  -- Receive: aList, a list of integers; and        -
  --          aValue, an integer.                   -
  -- Return: the position of aValue within aList, if-
  --         aValue is present in aList; -1,        - 
  --         otherwise.                             -
  ---------------------------------------------------

  function Search(A_List : in List; A_Value: in Integer) return Integer;

 private
   type List_Node;
   type Node_Ptr is access List_Node;
   type List_Node is
          record
           Its_Value : Integer;
           Its_Next : Node_Ptr;
          end record;
   type List is
          record
           Its_Length : Integer;
           Its_First : Node_Ptr;
           Its_Last : Node_Ptr;
          end record;

end List_Package;

ajs244@gold09:~/cs214/projects/proj09/ada$ gnatmake searchlist.adb
gnatmake: "searchlist" up to date.
ajs244@gold09:~/cs214/projects/proj09/ada$ ./searchlist

list1:           99          88          77          66          55
list2:           55          66          77          88          99
list3:           55          77          99          88          66
list4:            5           6           7           8           9

Position of 99 in List1:           0
Position of 99 in List2:           4
Position of 99 in List3:           2
Position of 99 in List4:          -1

ajs244@gold09:~/cs214/projects/proj09/ada$ exit

Script done on Tue 23 Apr 2019 08:27:04 PM EDT
