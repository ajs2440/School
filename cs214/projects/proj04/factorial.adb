-- factorial.adb computes and returns the factorial of an integer n
--
-- Input: n, an integer.
-- Precondition: n is a positive number.
-- Output: the factorial of n.
--
-- Begun by: Prof. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 02/22/2019
----------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure factorial is

   n, answer: Integer;

   -- function factorial computes n factorial, given n
   -- Parameter: n, a float
   -- Precondition: n >= 0
   -- Return: n factorial
   ----------------------------------------------------
   function factorial(n: Integer) return Integer is
   begin
      answer := 1;
      if n >= 0 then
         for i in 2..n
         loop
            answer := answer * i;
         end loop;
         return answer;
      else return -1;   -- error condition, n not >= 0
      end if;
   end factorial;

begin                           
   New_Line;
   Put("To compute n!, enter n: ");
   Get(n);

   answer := factorial(n);

   New_Line;
   Put(n);
   Put("! = ");
   Put(answer);
   New_Line; New_Line;

end factorial;
