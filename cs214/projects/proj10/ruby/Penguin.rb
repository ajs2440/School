# Penguin.rb | Defines the Penguin class which inherits attributes and methods
#   from the WalkingBird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/27/2019
####################################################

require './Bird.rb'

class Penguin < WalkingBird

  ####################################################
  # A Penguin's Call
  # Return: a Penguin sound ("Huh-huh-huh-huuuuh").
  ####################################################
  def call
    "Huh-huh-huh-huuuuh"
  end

end