# Bird.rb | Defines a Bird superclass 
#   to be extended by specific bird sub-classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/23/2019
####################################################

class Bird

  ####################################################
  # Name accessor
  # Return: my name attribute.
  ####################################################
  attr_reader :name

  ####################################################
  # explicit constructor
  # Receive: name, a String 
  # PostCond: this object's name attribute == name.
  ####################################################
  def initialize(name)
    @name = name
  end

  ####################################################
  # A Bird's Call
  # Return: a default bird-call ("Squaaaaaaawk!").
  ####################################################
  def call
    'Squaaaaaaawk!'
  end

  ####################################################
  # className
  # Return: a String representation of my class name.
  ####################################################
  def className
    self.class.to_s
  end

  ####################################################
  # Output a Bird 
  # Output: Everything known about myself
  #         to the standard output stream.
  ####################################################
  def print
    puts name + " " + className + " says " + "\"" + call + "\""
  end

end