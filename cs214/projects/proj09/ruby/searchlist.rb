# searchlist.rb tests the search subprogram given a Ruby linked list.
#
# Begun by: Dr. Adams for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/23/2019

require './List'

   # search() searches a given linked list for a given value
   # Receive: aList, a list of integers; and
   #          aValue, an integer.
   # Return: the position of aValue within aList, if aValue is present in aList;
   #         -1, otherwise.

   def search(aList, aValue)
      temp = aList.instance_variable_get(:@first)
      counter = 0
      while !temp.nil?
        if temp.value == aValue
          return counter
        end
        counter = counter + 1
        temp = temp.next
      end
      return -1
   end

list1 = List.new
list2 = List.new
list3 = List.new
list4 = List.new

list1.append(99).append(88).append(77).append(66).append(55)
list2.append(55).append(66).append(77).append(88).append(99)
list3.append(55).append(77).append(99).append(88).append(66)
list4.append(5).append(6).append(7).append(8).append(9)

puts
print "list 1: "; puts list1.print
print "list 2: "; puts list2.print
print "list 3: "; puts list3.print
print "list 4: "; puts list4.print
puts
print "Position of 99 in list1: "; puts search(list1, 99)
print "Position of 99 in list2: "; puts search(list2, 99)
print "Position of 99 in list3: "; puts search(list3, 99)
print "Position of 99 in list4: "; puts search(list4, 99)
puts
