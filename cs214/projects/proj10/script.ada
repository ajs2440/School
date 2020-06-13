Script started on Tue 30 Apr 2019 04:28:54 PM EDT
ajs244@gold21:~/cs214/projects/proj10/ada$ cat *.adb *.ads
-- bird_package.adb gives Bird-related definitions
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/23/2019
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Bird_Package is


 ----------------------------------------------------
 -- initialization                                  -
 -- Receive: A_Bird, a Bird_Type;                   -
 --          Name, a String                         -
 -- Return: a Bird_Type in which My_Name = Name.    -
 ----------------------------------------------------
 procedure Init(A_Bird : out Bird_Type; Name : in String) is
   begin
    A_Bird.My_Name := Name;
   end Init;

 ----------------------------------------------------
 -- Name accessor                                   -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: A_Bird.My_Name.                         -
 ----------------------------------------------------
 function Name(A_Bird : in Bird_Type) return String is
   begin
    return A_Bird.My_Name;
   end Name;

 ----------------------------------------------------
 -- A Bird's Call                                   -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: a default bird-call ("Squawk!").        -
 ----------------------------------------------------
 function Call(A_Bird : in Bird_Type) return String is
   begin
    return "Squawwwwwwk!";
   end Call;

 ----------------------------------------------------
 -- Determine type of a Bird (for derived types)    -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: "Bird".                                 -
 ----------------------------------------------------
 function Type_Name(A_Bird : in Bird_Type) return String is
   begin
    return "Bird";
   end Type_Name;

 ----------------------------------------------------
 -- Output a Bird                                   -
 -- Receive: A_Bird, a Bird or subclass of Bird.    -
 -- Output: Everything known about A_Bird           -
 ----------------------------------------------------
 procedure Put(A_Bird : in Bird_Type'Class) is
   begin
    Put( Name(A_Bird) );
    Put( ' ' );
    Put( Type_Name(A_Bird) );
    Put( ' ' );
    Put( Movement(A_Bird) );
    Put( " and said, " );
    Put( "'" );
    Put( Call(A_Bird) );
    Put( "'" );
   end Put; 

end Bird_Package;

-- birds.adb tests our Birds type hierarchy.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College
-- Completed by: Advait Scaria
-- Date: 04/23/2019
-----------------------------------------------------

with Bird_Package, 
     Duck_Package, 
     Goose_Package, 
     Owl_Package,
     Penguin_Package, 
     Ostrich_Package, 
     Kiwi_Package,
     Ada.Text_IO;
use Bird_Package,
    Duck_Package, 
    Goose_Package,
    Owl_Package,
    Penguin_Package, 
    Ostrich_Package, 
    Kiwi_Package,
    Ada.Text_IO;


procedure Birds is

 Bird1 : Duck_Type;       
 Bird2 : Penguin_Type;     
 Bird3 : Goose_Type;       
 Bird4 : Ostrich_Type;   
 Bird5 : Owl_Type;    
 Bird6 : Kiwi_Type;    

begin
   New_Line;
   Put("Welcome to the Bird Park!"); New_Line;
   New_Line;

   Init(Bird1, "Donald");
   Init(Bird2, "Peters");
   Init(Bird3, "Mother");
   Init(Bird4, "Orvill");
   Init(Bird5, "Woodsy");
   Init(Bird6, "Kooler");

   Put(Bird1); New_Line;   
   Put(Bird2); New_Line;
   Put(Bird3); New_Line;
   Put(Bird4); New_Line;
   Put(Bird5); New_Line;
   Put(Bird6); New_Line;

 New_Line;
end Birds;

-- duck_package.adb gives Duck-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/27/2019
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Duck_Package is

 ----------------------------------------------------
 -- A Duck's Call (Over-rides Bird.Call())          -
 -- Receive: A_Duck, a Duck_Type.                   -
 -- Return: "Quack"                                -
 ----------------------------------------------------
 function Call(A_Duck : in Duck_Type) return String is
   begin
    return "Quack";
   end Call;

 ------------------------------------------------------------
 -- Determine type of a Duck (Over-rides Bird.Type_Name()) -
 -- Receive: A_Duck, a Duck_Type.                          -
 -- Return: "Duck".                                        -
 -----------------------------------------------------------
 function Type_Name(A_Duck : in Duck_Type) return String is
   begin
    return "Duck";
   end Type_Name;

end Duck_Package;
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
-- goose_package.adb gives Goose-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/23/2019
---------------------------------------------------

package body Goose_Package is

 ----------------------------------------------------
 -- A Goose's Call (Over-rides Bird.Call())         -
 -- Receive: A_Goose, a Goose_Type.                 -
 -- Return: "Honk"                                 -
 ----------------------------------------------------
 function Call(A_Goose : in Goose_Type) return String is
    begin
     return "Honk";
    end Call;

 -----------------------------------------------------
 -- Determine type of a Goose                        -
 -- (Over-rides Bird.Type_Name())                    -
 -- Receive: A_Goose, a Goose_Type.                  -
 -- Return: "Goose".                                 -
 -----------------------------------------------------
 function Type_Name(A_Goose : in Goose_Type) return String is
    begin
     return "Goose";
    end Type_Name;


end Goose_Package;
-- kiwi_package.adb gives Kiwi-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/27/2019
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Kiwi_Package is

 ----------------------------------------------------
 -- A Kiwi's Call (Over-rides Bird.Call())          -
 -- Receive: A_Kiwi, a Kiwi_Type.                   -
 -- Return: "Noot-noot"                             -
 ----------------------------------------------------
 function Call(A_Kiwi : in Kiwi_Type) return String is
   begin
    return "Noot-noot";
   end Call;

 ------------------------------------------------------------
 -- Determine type of a Kiwi (Over-rides Bird.Type_Name()) -
 -- Receive: A_Kiwi, a Kiwi_Type.                          -
 -- Return: "Kiwi".                                        -
 -----------------------------------------------------------
 function Type_Name(A_Kiwi : in Kiwi_Type) return String is
   begin
    return "Kiwi";
   end Type_Name;

end Kiwi_Package;
-- ostrich_package.adb gives Ostrich-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/27/2019
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Ostrich_Package is

 ----------------------------------------------------
 -- A Ostrich's Call (Over-rides Bird.Call())          -
 -- Receive: A_Ostrich, a Ostrich_Type.                   -
 -- Return: "Snork"                                -
 ----------------------------------------------------
 function Call(A_Ostrich : in Ostrich_Type) return String is
   begin
    return "Snork";
   end Call;

 ------------------------------------------------------------
 -- Determine type of a Ostrich (Over-rides Bird.Type_Name()) -
 -- Receive: A_Ostrich, a Ostrich_Type.                          -
 -- Return: "Ostrich".                                        -
 -----------------------------------------------------------
 function Type_Name(A_Ostrich : in Ostrich_Type) return String is
   begin
    return "Ostrich";
   end Type_Name;

end Ostrich_Package;
-- owl_package.adb gives Owl-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/23/2019
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Owl_Package is


 ----------------------------------------------------
 -- A Owl's Call (Over-rides Bird.Call())           -
 -- Receive: An_Owl, an Owl_Type.                   -
 -- Return: "Whoo-hoo"                                 -
 ----------------------------------------------------
 function Call(An_Owl : in Owl_Type) return String is
    begin
     return "Whoo-hoo";
    end Call;

 -----------------------------------------------------
 -- Determine type of a Owl                          -
 -- (Over-rides Bird.Type_Name())                    -
 -- Receive: An_Owl, an Owl_Type.                    -
 -- Return: "Owl".                                   -
 -----------------------------------------------------
 function Type_Name(An_Owl : in Owl_Type) return String is
    begin
     return "Owl";
    end Type_Name;

end Owl_Package;
-- penguin_package.adb gives Penguin-related definitions
--  by over-riding Bird-related definitions.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/27/2019
---------------------------------------------------

with Ada.Text_IO;
use Ada.Text_IO;

package body Penguin_Package is

 ----------------------------------------------------
 -- A Penguin's Call (Over-rides Bird.Call())          -
 -- Receive: A_Penguin, a Penguin_Type.                   -
 -- Return: "Huh-huh-huh-huuuuh"                                -
 ----------------------------------------------------
 function Call(A_Penguin : in Penguin_Type) return String is
   begin
    return "Huh-huh-huh-huuuuh";
   end Call;

 ------------------------------------------------------------
 -- Determine type of a Penguin (Over-rides Bird.Type_Name()) -
 -- Receive: A_Penguin, a Penguin_Type.                          -
 -- Return: "Penguin".                                        -
 -----------------------------------------------------------
 function Type_Name(A_Penguin : in Penguin_Type) return String is
   begin
    return "Penguin";
   end Type_Name;

end Penguin_Package;
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
-- bird_package.ads gives Bird-related declarations
--
-- Begun by: Dr. Adams, for CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/23/2019
---------------------------------------------------

package Bird_Package is

 type Bird_Type is abstract tagged private;

 ----------------------------------------------------
 -- initialization                                  -
 -- Receive: A_Bird, a Bird_Type;                   -
 --          Name, a String                         -
 -- Return: a Bird_Type whose My_Name = Name.       -
 ----------------------------------------------------
 procedure Init(A_Bird : out Bird_Type; Name : in String);

 ----------------------------------------------------
 -- Name accessor                                   -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: A_Bird.My_Name.                         -
 ----------------------------------------------------
 function  Name(A_Bird : in Bird_Type) return String;

 ----------------------------------------------------
 -- A Bird's Call                                   -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: a default bird-call ("Squawk!").        -
 ----------------------------------------------------
 function  Call(A_Bird : in Bird_Type) return String;

 ----------------------------------------------------
 -- A Bird's Movement                               -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: a bird movement.				        -
 ----------------------------------------------------
 function  Movement(A_Bird : in Bird_Type) return String is abstract;

 ----------------------------------------------------
 -- Determine type of a Bird (for derived types)    -
 -- Receive: A_Bird, a Bird_Type.                   -
 -- Return: "Bird".                                 -
 ----------------------------------------------------
 function  Type_Name(A_Bird : in Bird_Type) return String;

 ----------------------------------------------------
 -- Output a Bird                                   -
 -- Receive: A_Bird, a Bird or subclass of Bird.    -
 -- Output: Everything known about A_Bird           -
 ----------------------------------------------------
 procedure Put(A_Bird : in Bird_Type'Class);

private

	type Bird_Type is abstract
  		tagged record
   			My_Name : String(1..6);
  		end record;

end Bird_Package;
-- duck_package.ads gives Duck-related declarations,
--
--  and derives Duck from FlyingBird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/27/2019
---------------------------------------------------

with FlyingBird_Package; use FlyingBird_Package;

package Duck_Package is

 type Duck_Type is new FlyingBird_Type with private;

 ----------------------------------------------------
 -- A Duck's Call (Over-rides Bird.Call())          -
 -- Receive: A_Duck, a Duck_Type.                   -
 -- Return: "Quack!"                                -
 ----------------------------------------------------
 function  Call(A_Duck : in Duck_Type) return String;

 ------------------------------------------------------------
 -- Determine type of a Duck (Over-rides Bird.Type_Name()) -
 -- Receive: A_Duck, a Duck_Type.                          -
 -- Return: "Duck".                                        -
 -----------------------------------------------------------
 function  Type_Name(A_Duck : in Duck_Type) return String;

private

	type Duck_Type is new FlyingBird_Type with
    	record
        	null;
    	end record;

end Duck_Package;
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
-- goose_package.ads gives Goose-related declarations,
--
--  and derives Goose from Bird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/23/2019
---------------------------------------------------

with FlyingBird_Package; use FlyingBird_Package;

package Goose_Package is

 type Goose_Type is new FlyingBird_Type with private;


 ----------------------------------------------------
 -- A Goose's Call (Over-rides Bird.Call())         -
 -- Receive: A_Goose, a Goose.                      -
 -- Return: "Honk!"                                 -
 ----------------------------------------------------
 function  Call(A_Goose : in Goose_Type) return String;

 -----------------------------------------------------
 -- Determine type of a Goose                        -
 -- (Over-rides Bird.Type_Name())                    -
 -- Receive: A_Goose, a Goose.                       -
 -- Return: "Goose".                                 -
 -----------------------------------------------------
 function  Type_Name(A_Goose : in Goose_Type) return String;

private

	type Goose_Type is new FlyingBird_Type with
    	record
        	null;
        end record;


end Goose_Package;
-- kiwi_package.ads gives Kiwi-related declarations,
--
--  and derives Kiwi from WalkingBird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/27/2019
---------------------------------------------------

with WalkingBird_Package; use WalkingBird_Package;

package Kiwi_Package is

 type Kiwi_Type is new WalkingBird_Type with private;

 ----------------------------------------------------
 -- A Kiwi's Call (Over-rides Bird.Call())          -
 -- Receive: A_Kiwi, a Kiwi_Type.                   -
 -- Return: "Noot-noot"                             -
 ----------------------------------------------------
 function  Call(A_Kiwi : in Kiwi_Type) return String;

 ------------------------------------------------------------
 -- Determine type of a Kiwi (Over-rides Bird.Type_Name()) -
 -- Receive: A_Kiwi, a Kiwi_Type.                          -
 -- Return: "Kiwi".                                        -
 -----------------------------------------------------------
 function  Type_Name(A_Kiwi : in Kiwi_Type) return String;

private

	type Kiwi_Type is new WalkingBird_Type with
    	record
        	null;
    	end record;

end Kiwi_Package;
-- ostrich_package.ads gives Ostrich-related declarations,
--
--  and derives Ostrich from WalkingBird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/27/2019
---------------------------------------------------

with WalkingBird_Package; use WalkingBird_Package;

package Ostrich_Package is

 type Ostrich_Type is new WalkingBird_Type with private;

 ----------------------------------------------------
 -- A Ostrich's Call (Over-rides Bird.Call())          -
 -- Receive: A_Ostrich, a Ostrich_Type.                   -
 -- Return: "Snork"                                -
 ----------------------------------------------------
 function  Call(A_Ostrich : in Ostrich_Type) return String;

 ------------------------------------------------------------
 -- Determine type of a Ostrich (Over-rides Bird.Type_Name()) -
 -- Receive: A_Ostrich, a Ostrich_Type.                          -
 -- Return: "Ostrich".                                        -
 -----------------------------------------------------------
 function  Type_Name(A_Ostrich : in Ostrich_Type) return String;

private

	type Ostrich_Type is new WalkingBird_Type with
    	record
        	null;
    	end record;

end Ostrich_Package;
-- owl_package.ads gives Owl-related declarations,
--  and derives Owl from Bird.
--
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/23/2019
---------------------------------------------------

with FlyingBird_Package; use FlyingBird_Package;

package Owl_Package is

 type Owl_Type is new FlyingBird_Type with private;

 ----------------------------------------------------
 -- A Owl's Call (Over-rides Bird.Call())           -
 -- Receive: An_Owl, an Owl_Type.                   -
 -- Return: "Whoo!"                                 -
 ----------------------------------------------------
 function  Call(An_Owl : in Owl_Type) return String;

 -----------------------------------------------------
 -- Determine type of a Owl                          -
 -- (Over-rides Bird.Type_Name())                    -
 -- Receive: An_Owl, an Owl_Type.                    -
 -- Return: "Owl".                                   -
 -----------------------------------------------------
 function  Type_Name(An_Owl : in Owl_Type) return String;

private

	type Owl_Type is new FlyingBird_Type with
    	record
        	null;
        end record;

end Owl_Package;
-- penguin_package.ads gives Penguin-related declarations,
--
--  and derives Penguin from WalkingBird.
-- Begun by: Dr. Adams, CS 214 at Calvin College.
-- Completed by: Advait Scaria
-- Date: 04/27/2019
---------------------------------------------------

with WalkingBird_Package; use WalkingBird_Package;

package Penguin_Package is

 type Penguin_Type is new WalkingBird_Type with private;

 ----------------------------------------------------
 -- A Penguin's Call (Over-rides Bird.Call())          -
 -- Receive: A_Penguin, a Penguin_Type.                   -
 -- Return: "Huh-huh-huh-huuuuh"                                -
 ----------------------------------------------------
 function  Call(A_Penguin : in Penguin_Type) return String;

 ------------------------------------------------------------
 -- Determine type of a Penguin (Over-rides Bird.Type_Name()) -
 -- Receive: A_Penguin, a Penguin_Type.                          -
 -- Return: "Penguin".                                        -
 -----------------------------------------------------------
 function  Type_Name(A_Penguin : in Penguin_Type) return String;

private

	type Penguin_Type is new WalkingBird_Type with
    	record
        	null;
    	end record;

end Penguin_Package;
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
ajs244@gold21:~/cs214/projects/proj10/ada$ ./birds

Welcome to the Bird Park!

Donald Duck just flew past and said, 'Quack'
Peters Penguin just walked past and said, 'Huh-huh-huh-huuuuh'
Mother Goose just flew past and said, 'Honk'
Orvill Ostrich just walked past and said, 'Snork'
Woodsy Owl just flew past and said, 'Whoo-hoo'
Kooler Kiwi just walked past and said, 'Noot-noot'

ajs244@gold21:~/cs214/projects/proj10/ada$ exit

Script done on Tue 30 Apr 2019 04:31:02 PM EDT
