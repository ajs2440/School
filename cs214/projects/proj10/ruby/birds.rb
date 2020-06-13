# birds.rb | Tests out the menagerie of bird classes.
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

puts "\n\n"