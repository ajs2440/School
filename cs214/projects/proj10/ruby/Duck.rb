# Duck.rb | Defines the Duck class which inherits attributes and methods
#   from the FlyingBird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/27/2019
####################################################

require './Bird.rb'

class Duck < FlyingBird

  ####################################################
  # A Duck's Call
  # Return: a duck sound ("Quack").
  ####################################################
  def call
    'Quack'
  end

end