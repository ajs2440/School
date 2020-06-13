# FlyingBird.rb | Defines the FlyingBird class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/27/2019
####################################################

require './Bird.rb'

class FlyingBird < Bird

  ####################################################
  # A FlyingBird's Movement
  # Return: a String decribing a FlyingBird's movement.
  ####################################################
  def movement
    "just flew past"
  end

end