Script started on Wed 24 Apr 2019 05:51:16 PM EDT
ajs244@gold10:~/cs214/labs/10/ruby$ cat *.rb
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

end# birds.rb | Tests out the menagerie of bird classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/23/2019
######################################################

require './Bird.rb'
require './Duck.rb'
require './Goose.rb'
require './Owl.rb'

puts "\nWelcome to the Bird Park!\n\n"

bird0 = Bird.new "Hawkeye"
bird0.print

bird1 = Duck.new "Donald"
bird1.print

bird2 = Goose.new "Mother"
bird2.print

bird3 = Owl.new "Woodsey"
bird3.print

puts "\n\n"# Duck.rb | Defines the Duck class which inherits attributes and methods
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

end# Goose.rb | Defines the Goose class which inherits attributes and methods
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

end# Owl.rb | Defines the Owl class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/23/2019
####################################################

require './Bird.rb'

class Owl < Bird

  ####################################################
  # An Owl's Call
  # Return: an owl sound ("Whoo-hoo!").
  ####################################################
  def call
    'Whoo-hoo!'
  end

endajs244@gold10:~/cs214/labs/10/ruby$ ruby birds.rb

Welcome to the Bird Park!

Hawkeye Bird says "Squaaaaaaawk!"
Donald Duck says "Quack!"
Mother Goose says "Honk!"
Woodsey Owl says "Whoo-hoo!"


ajs244@gold10:~/cs214/labs/10/ruby$ exit

Script done on Wed 24 Apr 2019 05:51:44 PM EDT
