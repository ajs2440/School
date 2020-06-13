-- roots.adb computes the roots of an input quadratic equation.
--
-- Input: a, b, c - coefficients of the quadratic equation.
-- Precondition: valid numbers of type double for coefficient inputs.
-- Output: The 2 roots of the quadratic equation, if any.
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 03/07/2019
--------------------------------------------------------------

with Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;
use  Ada.Text_IO, Ada.Float_Text_IO, Ada.Numerics.Elementary_Functions;

procedure roots is

   a, b, c, root1, root2, arg : Float;
   valid : boolean;

   ------------------------------------------------
   -- quadraticRoots() computes the roots of a quadratic equation.           
   -- Receive: a, b, c - coefficients of type double.        
   -- PRE: a, b, c must be valid numbers.
   -- Return: calculated root1 and root2.
   ------------------------------------------------
   procedure quadraticRoots(a, b, c : in Float; root1, root2, arg : out Float; valid : out Boolean) is
   begin
   if a /= 0.0 then
         arg := b**2 - 4.0 * a * c;
      if arg >= 0.0 then
         root1 := (-b + Sqrt(arg))/(2.0 * a);
         root2 := (-b - Sqrt(arg))/(2.0 * a);
         valid := true;
      else 
         root1 := 0.0;
         root2 := 0.0;
         valid := false;
         Put_Line("");
         Put_Line("b^2 - 4ac is negative!"); 
         Put_Line("");
      end if;
   else 
      root1 := 0.0;
      root2 := 0.0;
      valid := false;
      Put_Line("");
      Put_Line("a is zero!"); 
      Put_Line("");
   end if;

   end quadraticRoots;

begin                                           -- Prompt for input
   Put_Line("To compute the roots enter the values of the coefficients: ");
   
   Put("a = ");
   Get(a);
   Put("b = ");
   Get(b);
   Put("c = ");
   Get(c);

   quadraticRoots(a, b, c, root1, root2, arg, valid);

   if valid = true then
      Put_Line("");
      Put("the first root is: ");
      Put(root1);
      Put_Line("");
      Put("the second root is: ");
      Put(root2);
      Put_Line("");
      Put_Line("");
   end if;

end roots;
