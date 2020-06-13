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

