# Ostrich.rb | Defines the Ostrich class which inherits attributes and methods
#   from the WalkingBird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/27/2019
####################################################

require './Bird.rb'

class Ostrich < WalkingBird

  ####################################################
  # A Ostrich's Call
  # Return: a Ostrich sound ("Huh-huh-huh-huuuuh").
  ####################################################
  def call
    "Snork"
  end

end