Script started on Tue 30 Apr 2019 04:35:26 PM EDT
ajs244@gold21:~/cs214/projects/proj10/ruby$ cat *.rb
# Bird.rb | Defines a Bird superclass 
#   to be extended by specific bird sub-classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/27/2019
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
  # A Bird's Movement
  # Return: a specified bird's movement or raise 
  #         an error message.
  ####################################################
  def movement; end

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
    puts name + " " + className + " " + movement  +  " and said, " + "\"" + call + "\""
  end

end# birds.rb | Tests out the menagerie of bird classes.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/23/2019
######################################################

require './Bird.rb'
require './FlyingBird.rb'
require './WalkingBird.rb'
require './Duck.rb'
require './Goose.rb'
require './Owl.rb'
require './Penguin.rb'
require './Ostrich.rb'
require './Kiwi.rb'

puts "\nWelcome to the Bird Park!\n\n"

bird1 = Duck.new "Donald"
bird2 = Penguin.new "Peter"
bird3 = Goose.new "Mother"
bird4 = Ostrich.new "Orville"
bird5 = Owl.new "Woodsey"
bird6 = Kiwi.new "Kool"

bird1.print
bird2.print
bird3.print
bird4.print
bird5.print
bird6.print

puts "\n\n"# Duck.rb | Defines the Duck class which inherits attributes and methods
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

end# FlyingBird.rb | Defines the FlyingBird class which inherits attributes and methods
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

end# Goose.rb | Defines the Goose class which inherits attributes and methods
#   from the FlyingBird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/23/2019
####################################################

require './Bird.rb'

class Goose < FlyingBird

  ####################################################
  # A Goose's Call
  # Return: a goose sound ("Honk").
  ####################################################
  def call
    'Honk'
  end

end# Kiwi.rb | Defines the Kiwi class which inherits attributes and methods
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

end# Ostrich.rb | Defines the Ostrich class which inherits attributes and methods
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

end# Owl.rb | Defines the Owl class which inherits attributes and methods
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

end# Penguin.rb | Defines the Penguin class which inherits attributes and methods
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

end# WalkingBird.rb | Defines the WalkingBird class which inherits attributes and methods
#   from the Bird superclass.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/27/2019
####################################################

require './Bird.rb'

class WalkingBird < Bird

  ####################################################
  # A WalkingBird's Movement
  # Return: a String decribing a WalkingBird's movement.
  ####################################################
  def movement
    "just walked past"
  end

endajs244@gold21:~/cs214/projects/proj10/ruby$ ruby birds.rb

Welcome to the Bird Park!

Donald Duck just flew past and said, "Quack"
Peter Penguin just walked past and said, "Huh-huh-huh-huuuuh"
Mother Goose just flew past and said, "Honk"
Orville Ostrich just walked past and said, "Snork"
Woodsey Owl just flew past and said, "Whoo-hoo"
Kool Kiwi just walked past and said, "Noot-noot"


ajs244@gold21:~/cs214/projects/proj10/ruby$ exit

Script done on Tue 30 Apr 2019 04:36:00 PM EDT
