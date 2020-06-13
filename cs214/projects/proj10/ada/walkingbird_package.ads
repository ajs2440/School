-- walkingbird_package.ads gives WalkingBird-related declarations,
--
--  and derives WalkingBird from Bird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/27/2019
---------------------------------------------------

with Bird_Package; use Bird_Package;

package WalkingBird_Package is

 type WalkingBird_Type is new Bird_Type with private;

 ----------------------------------------------------------------
 -- A WalkingBird's Movement (Over-rides Bird.Movement())       -
 -- Receive: A_WalkingBird, a WalkingBird_Type.                 -
 -- Return: String describing walking bird movement             -
 ----------------------------------------------------------------
 function Movement(A_WalkingBird : in WalkingBird_Type) return String;

private

	type WalkingBird_Type is new Bird_Type with
    	record
        	null;
    	end record;

end WalkingBird_Package;
