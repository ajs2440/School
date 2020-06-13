-- flyingbird_package.ads gives FlyingBird-related declarations,
--
--  and derives FlyingBird from Bird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/27/2019
---------------------------------------------------

with Bird_Package; use Bird_Package;

package FlyingBird_Package is

 type FlyingBird_Type is new Bird_Type with private;

 ----------------------------------------------------------------
 -- A FlyingBird's Movement (Over-rides Bird.Movement())        -
 -- Receive: A_FlyingBird, a FlyingBird_Type.                   -
 -- Return: String describing flying bird movement              -
 ----------------------------------------------------------------
 function Movement(A_FlyingBird : in FlyingBird_Type) return String;

private

	type FlyingBird_Type is new Bird_Type with
    	record
        	null;
    	end record;

end FlyingBird_Package;
