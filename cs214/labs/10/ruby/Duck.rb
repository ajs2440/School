# Duck.rb | Defines the Duck class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/23/2019
####################################################

require './Bird.rb'

class Duck < Bird

  ####################################################
  # A Duck's Call
  # Return: a duck sound ("Quack!").
  ####################################################
  def call
    'Quack!'
  end

end