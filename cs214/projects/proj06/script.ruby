Script started on Fri 15 Mar 2019 04:41:30 PM EDT
ajs244@gold29:~/cs214/projects/proj06$ cat arrays.rb
# arrays.rb is a driver for array methods printArray() and readArray().
#
# Precondition: valid size and double numbers must be input.
# Output: prints elements of anArray to console or reads and fills
#          elements into anArray from console input.
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 03/08/2019
#################################################################


# readArray() is a method that reads the inputted elements and 
#                fills anArray with those elements.
# Receive: anArray, an array with double elements
#          itsSize, type int - specifies anArray's size.
# Return: .
# Precondition: Size must be > 0.
# Postcondition: Reads valid element inputs from console and 
#                populates anArray with them.
#################################################################

def readArray(anArray)
	for i in 1..anArray.size
		print "Enter element #{ i }: "
		anArray << gets.to_f
	end
#	print "\nEnter #{ anArray.size } elements: "
#	anArray.each {| item | item = gets.to_f}
end

# printArray() is a method that prints the elements within an array.
# Receive: anArray, an array with double elements
#          itsSize, type int - specifies anArray's size.
# Return: .
# Precondition: Size must be >= 0.
# Postcondition: Prints elements of anArray to console.
#################################################################

def printArray(anArray)
	print "\nHere are the elements in your array: "
	anArray.each {| item | print "#{ item }  "}
end


def main
  print "\nEnter the size of the array: "
  size = gets.to_i
  anArray = Array.new(size)
  
  puts
  readArray(anArray)
  printArray(anArray)
  puts 
  puts
end


main
ajs244@gold29:~/cs214/projects/proj06$ ruby arrays.rb

Enter the size of the array: 2

Enter element 1: 1
Enter element 2: 2

Here are the elements in your array:     1.0  2.0  

ajs244@gold29:~/cs214/projects/proj06$ ruby arrays.rb

Enter the size of the array: 5

Enter element 1: 5
Enter element 2: 4
Enter element 3: 3
Enter element 4: 2
Enter element 5: 1

Here are the elements in your array:           5.0  4.0  3.0  2.0  1.0  

ajs244@gold29:~/cs214/projects/proj06$ exit

Script done on Fri 15 Mar 2019 04:41:59 PM EDT
