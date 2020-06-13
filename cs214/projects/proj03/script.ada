Script started on Tue 19 Feb 2019 01:59:34 PM EST
ajs244@maroon02:~/cs214/projects/proj03$ cat letter_grade.adb
-- letter_grade.adb computes the grade of a student given the average number grade
--
-- Input: The average number grade out of 100.
-- Precondition: The average is a positive number.
-- Output: The letter grade of the student.
--
-- Begun by: Prof. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 02/19/2019
----------------------------------------------------

with Ada.Text_IO, Ada.Integer_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO;

procedure letter_grade is

   average : Integer; letter : Character;

   -- function letterGrade computes a student's letter grade, given the average number grade
   -- Parameter: average, an int
   -- Precondition: average >= 0
   -- Return: the corresponding letter grade of the student
   ----------------------------------------------------
   function letterGrade(average: Integer) return character is
   begin
      case average / 10 is
         when 10 | 9 =>
            return 'A';
         when 8 =>
            return 'B';
         when 7 =>
            return 'C';
         when 6 =>
            return 'D';
         when others =>
            return 'F';
      end case;
   end letterGrade;

begin                           
   New_Line;
   Put("Enter the average number grade: ");
   Get(average);

   letter := letterGrade(average);

   New_Line;
   Put("The letter grade is: ");
   Put(letter);
   New_Line; New_Line; 

end letter_grade;ajs244@maroon02:~/cs214/projects/proj03$ gnatmake letter_grade
gnatmake: "letter_grade" up to date.
ajs244@maroon02:~/cs214/projects/proj03$ ./letter_grade

Enter the average number grade: 100

The letter grade is: A

ajs244@maroon02:~/cs214/projects/proj03$ ./letter_grade

Enter the average number grade: 90

The letter grade is: A

ajs244@maroon02:~/cs214/projects/proj03$ ./letter_grade

Enter the average number grade: 89

The letter grade is: B

ajs244@maroon02:~/cs214/projects/proj03$ ./letter_grade

Enter the average number grade: 0 80

The letter grade is: B

ajs244@maroon02:~/cs214/projects/proj03$ ./letter_grade

Enter the average number grade: 79

The letter grade is: C

ajs244@maroon02:~/cs214/projects/proj03$ ./letter_grade

Enter the average number grade: 70

The letter grade is: C

ajs244@maroon02:~/cs214/projects/proj03$ ./letter_grade

Enter the average number grade: 69

The letter grade is: D

ajs244@maroon02:~/cs214/projects/proj03$ ./letter_grade

Enter the average number grade: 60

The letter grade is: D

ajs244@maroon02:~/cs214/projects/proj03$ ./letter_grade

Enter the average number grade: 59

The letter grade is: F

ajs244@maroon02:~/cs214/projects/proj03$ ./letter_grade

Enter the average number grade: 0

The letter grade is: F

ajs244@maroon02:~/cs214/projects/proj03$ exit

Script done on Tue 19 Feb 2019 02:00:58 PM EST
