# max.rb tests a Ruby linked list.
#
# Begun by: Dr. Adams for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/12/2019

require './List'

list1 = List.new
list2 = List.new
list3 = List.new

list1.append(99).append(88).append(77).append(66).append(55)
list2.append(55).append(66).append(77).append(88).append(99)
list3.append(55).append(77).append(99).append(88).append(66)

puts
list1.print 
puts
puts "Maximum of list1: #{list1.max}"
puts

list2.print 
puts
puts "Maximum of list2: #{list2.max}"
puts

list3.print 
puts
puts "Maximum of list3: #{list3.max}"
puts
