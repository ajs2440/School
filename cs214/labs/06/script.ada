Script started on Thu 07 Mar 2019 04:09:53 PM EST
ajs244@gold08:~/cs214/labs/06$ cat ^C
ajs244@gold08:~/cs214/labs/06$ ^C
ajs244@gold08:~/cs214/labs/06$ ^C
ajs244@gold08:~/cs214/labs/06$ script script.ruby
Script started, file is script.ruby
ajs244@gold08:~/cs214/labs/06$ cat average.rb
# average.rb averages the values of an array of doubles.
# Precondition: theArray is an array of numbers
# Output: the average of the values in theArray
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 03/07/2019
########################################################

###############################################
# sum() sums the values in an array
# Receive: anArray, an array of numbers
# Return: the sum of the values in anArray.
################################################

def sum(anArray)
	total = 0.0
	anArray.each {| item | total += item}
	return total
end

#############################################################################
# average() is a method that computes the average of the values in an array. 
# Receive: anArray, an array of numbers.								  
# Return: the average of the values in anArray.
#############################################################################

def average(anArray)
	if anArray.empty? then
		return 0.0
	else 
		return sum(anArray)/anArray.size
	end
end

def main

    array0 = Array.new(0)
    array1 = [9.0, 8.0, 7.0, 6.0]

    puts "\nsum 0 is: #{ sum(array0) }\n"
    puts "sum 1 is: #{ sum(array1) }\n"

    puts "\naverage 0 is: #{ average(array0) }\n"
    puts "average 1 is: #{ average(array1) }\n\n"
end

main

ajs244@gold08:~/cs214/labs/06$ ruby averg age.rb

sum 0 is: 0.0
sum 1 is: 30.0

average 0 is: 0.0
average 1 is: 7.5

ajs244@gold08:~/cs214/labs/06$ exit
Script done, file is script.ruby
ajs244@gold08:~/cs214/labs/06$ script script.ada
Script started, file is script.ada
ajs244@gold08:~/cs214/labs/06$ cat averagead  .adb
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
ajs244@gold08:~/cs214/labs/06$ gnatmake average.adb
gnatmake: "average" up to date.
ajs244@gold08:~/cs214/labs/06$ ./average

 average 0 is  0.00000E+00
 average 1 is  7.50000E+00

ajs244@gold08:~/cs214/labs/06$ exit
Script done, file is script.ada
ajs244@gold08:~/cs214/labs/06$ cat script.* > lab06-results
ajs244@gold08:~/cs214/labs/06$ cd .. ..
ajs244@gold08:~/cs214/labs$ cd ....
bash: cd: ....: No such file or directory
ajs244@gold08:~/cs214/labs$ cd ..
ajs244@gold08:~/cs214$ cd projecs ts/proj06
ajs244@gold08:~/cs214/projects/proj06$ ls
ajs244@gold08:~/cs214/projects/proj06$ subl Roots.java
ajs244@gold08:~/cs214/projects/proj06$ exit

Script done on Thu 07 Mar 2019 04:14:27 PM EST
