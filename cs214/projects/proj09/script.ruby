Script started on Tue 23 Apr 2019 10:34:42 PM EDT
ajs244@gold09:~/cs214/projects/proj09/ruby$ cat *.rb
# List.rb implements a linked list structure in Ruby.
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/12/2019
#######################################################

require 'test/unit/assertions'
include Test::Unit::Assertions

class List

   # initialize a List to be empty
   # Postcondition: first == nil and last == nil and length == 0

   def initialize
      @first = nil
      @last = nil
      @length = 0
   end


   # create reader method for length

   attr_reader :length


   # Am I empty?
   # Return: length == 0
   def empty?
      @length == 0
   end
  
   # append a value to me
   # Receive: value, the item to be appended
   # Postcondition: my last item is value and
   #                 my length is one more than it was
   def append(value)
      newNode = Node.new(value, nil)

      if empty?
         @first = newNode
      else
         @last.next = newNode      
      end

      @last = newNode
      @length += 1
      self
   end


   # print my items
   # Postcondition: my items have been displayed to the screen

   def print
      temp = @first
       while !temp.nil?
         printf " #{temp.value}"
         temp = temp.next
       end
   end


   # find my maximum item
   # Return: my maximum item

   def max
      temp = @first
      maxValue = -999999
       while !temp.nil?
       	 if temp.value > maxValue
       	   maxValue = temp.value
       	 end
       	 temp = temp.next
       end
       return maxValue
   end


  class Node
   	def initialize(item, link)
        @value = item
    	@next = link
    end

    attr_reader :value
    attr_accessor :next
  end

end

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
ajs244@gold09:~/cs214/projects/proj09/ruby$ ruby searchlist.rb

list 1:  99 88 77 66 55
list 2:  55 66 77 88 99
list 3:  55 77 99 88 66
list 4:  5 6 7 8 9

Position of 99 in list1: 0
Position of 99 in list2: 4
Position of 99 in list3: 2
Position of 99 in list4: -1

ajs244@gold09:~/cs214/projects/proj09/ruby$ exit

Script done on Tue 23 Apr 2019 10:35:05 PM EDT
