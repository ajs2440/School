-- walkingbird_package.adb gives walking bird-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/27/2019
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body WalkingBird_Package is

 ----------------------------------------------------------------
 -- A WalkingBird's Movement (Over-rides Bird.Movement())       -
 -- Receive: A_WalkingBird, a WalkingBird_Type.                 -
 -- Return: String describing walking bird movement             -
 ----------------------------------------------------------------
 function Movement(A_WalkingBird : in WalkingBird_Type) return String is
   begin
    return "just walked past";
   end Movement;

end WalkingBird_Package;
