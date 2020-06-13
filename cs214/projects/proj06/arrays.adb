-- arrays.adb is a driver for reading and printing arrays.
--
-- Input: a, b, c - coefficients of the quadratic equation.
-- Precondition: valid size and double numbers must be input.
-- Output: prints elements of anArray to console or reads and fills
--          elements into anArray from console input.
--
-- Begun by: Prof. Adams, for CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 03/14/2019
--------------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Integer_Text_IO;

procedure arrays is

   type Vector is array (Positive range <>) of Float;
   size : Integer;

   -----------------------------------------------------------------
   -- readArray() is a method that reads the inputted elements and 
   --                fills anArray with those elements.
   -- Receive: anArray, an array with double elements.
   -- Postcondition: Reads valid element inputs from console and 
   --                populates anArray with them.
   -----------------------------------------------------------------
   procedure readArray(anArray : out Vector) is
   element : Float;
   begin
      for Index in anArray'Range          -- for loop defined for unconstrained Type Vector
      loop
         Put("Enter element: ");
         Get(element);
         anArray(Index) := element;
      end loop;
   end readArray;

   -----------------------------------------------------------------
   -- printArray() is a method that prints the inputted elements and 
   --                fills anArray with those elements.
   -- Receive: anArray, an array with double elements.
   -- Postcondition: Prints the elements in anArray to console.
   -----------------------------------------------------------------
   procedure printArray(anArray : in Vector) is
   begin
      Put("Here are your array's elements: ");
      for Index in anArray'Range          -- for loop defined for unconstrained Type Vector
      loop
         Put(anArray(Index), 1, 0, 0);
         if Index = anArray'Last then
            Put("");
         else
            Put(", ");
         end if;
      end loop;
   end printArray;

begin 
   New_Line;                                          -- Prompt for input
   Put("Enter the size of the array: ");
   Get(size);
   if size > 0 then
      declare
         anArray : Vector(1..size);
      begin
         New_Line;
         readArray(anArray);
         printArray(anArray);
         New_Line;
         New_Line;
      end;
   end if;

end arrays;
