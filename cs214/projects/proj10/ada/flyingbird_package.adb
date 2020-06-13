-- flyingbird_package.adb gives flying bird-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/27/2019
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body FlyingBird_Package is

 ----------------------------------------------------
 -- A FlyingBird's Movement (Over-rides Bird.Movement())          -
 -- Receive: A_Duck, a Duck_Type.                   -
 -- Return: "Quack!"                                -
 ----------------------------------------------------
 function Movement(A_FlyingBird : in FlyingBird_Type) return String is
   begin
    return "just flew past";
   end Movement;

end FlyingBird_Package;
