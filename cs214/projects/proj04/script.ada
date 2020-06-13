Script started on Tue 26 Feb 2019 02:18:40 PM EST
ajs244@maroon24:~/cs214/projects/proj04$ cat factorial.adb
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

   n: Integer; answer: Integer;

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
ajs244@maroon24:~/cs214/projects/proj04$ gnatmake factorial.adb
gcc-5 -c factorial.adb
gnatbind-5 -x factorial.ali
gnatlink-5 factorial.ali
ajs244@maroon24:~/cs214/projects/proj04$ ./factorial

To compute n!, enter n: -1

         -1! =          -1

ajs244@maroon24:~/cs214/projects/proj04$ ./factorial

To compute n!, enter n: 0

          0! =           1

ajs244@maroon24:~/cs214/projects/proj04$ ./factorial

To compute n!, enter n: 2

          2! =           2

ajs244@maroon24:~/cs214/projects/proj04$ ./factorial

To compute n!, enter n: 4

          4! =          24

ajs244@maroon24:~/cs214/projects/proj04$ ./factorial

To compute n!, enter n: 10

         10! =     3628800

ajs244@maroon24:~/cs214/projects/proj04$ exit

Script done on Tue 26 Feb 2019 02:19:14 PM EST
