# Kiwi.rb | Defines the Kiwi class which inherits attributes and methods
#   from the WalkingBird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/27/2019
####################################################

require './Bird.rb'

class Kiwi < WalkingBird

  ####################################################
  # A Kiwi's Call
  # Return: a Kiwi sound ("Huh-huh-huh-huuuuh").
  ####################################################
  def call
    "Noot-noot"
  end

end