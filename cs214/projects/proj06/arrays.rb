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
# Precondition: Size must be > 0.
# Postcondition: Reads valid element inputs from console and 
#                populates anArray with them.
#################################################################

def readArray(anArray)
	for i in 1..anArray.size
		print "Enter element #{ i }: "
		anArray << gets.chomp
	end
#	print "\nEnter #{ anArray.size } elements: "
#	anArray.each {| item | item = gets.to_f}
end

# printArray() is a method that prints the elements within an array.
# Receive: anArray, an array with double elements
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
