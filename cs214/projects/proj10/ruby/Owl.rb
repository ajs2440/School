# Owl.rb | Defines the Owl class which inherits attributes and methods
#   from the FlyingBird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/23/2019
####################################################

require './Bird.rb'

class Owl < FlyingBird

  ####################################################
  # An Owl's Call
  # Return: an owl sound ("Whoo-hoo").
  ####################################################
  def call
    'Whoo-hoo'
  end

end