# Goose.rb | Defines the Goose class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/23/2019
####################################################

require './Bird.rb'

class Goose < Bird

  ####################################################
  # A Goose's Call
  # Return: a goose sound ("Honk!").
  ####################################################
  def call
    'Honk!'
  end

end