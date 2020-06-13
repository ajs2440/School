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

