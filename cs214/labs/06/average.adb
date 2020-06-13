-- average.adb "test-drives" function Average.
-- Precondition: theArray is an array of numbers.
-- Output: the average of the numbers.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 03/07/2019
-----------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;             -- Put(String)
with Ada.Float_Text_IO; use Ada.Float_Text_IO; -- Put(Float)

procedure average is

type Vector is array (1 .. 4) of Float;

array0 : Vector := (0.0, 0.0, 0.0, 0.0);
array1 : Vector := (9.0, 8.0, 7.0, 6.0);

----------------------------------------------
-- sum() sums the values in an array.        -
-- Receive: anArray, an array of numbers.    -
-- Return: the sum of the values in anArray. -
----------------------------------------------

function sum(anArray : Vector) return Float is
total : Float := 0.0;
begin
--	for I in anArray'Range	-- for loop defined for unconstrained Type Vector
	for I in 1 .. 4			-- for loop defined for constrained Type Vector
	loop
		total := total + anArray(I);
	end loop;
	return total;
end sum;

---------------------------------------------------------------------------
-- average() is a method that computes the average of the values in an array. -
-- Receive: anArray, an array of numbers.								  -
-- Return: the average of the values in anArray.						  -
---------------------------------------------------------------------------

function average(anArray : Vector) return Float is
begin
	if anArray'Length = 0 then
		return 0.0;
	else
		return (sum(anArray)/(Float( anArray'Length )));
	end if;
end average;

begin
   New_line;
   Put(" average 0 is ");
   Put( average(array0) );
   New_line;
   Put(" average 1 is ");
   Put( average(array1) );
   New_line;
   New_line;
end average;

