# WalkingBird.rb | Defines the WalkingBird class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/27/2019
####################################################

require './Bird.rb'

class WalkingBird < Bird

  ####################################################
  # A WalkingBird's Movement
  # Return: a String decribing a WalkingBird's movement.
  ####################################################
  def movement
    "just walked past"
  end

end