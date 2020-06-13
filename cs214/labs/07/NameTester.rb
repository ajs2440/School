# NameTester.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 03/28/2019
####################################################

require 'test/unit/assertions'   # needed for assert
include Test::Unit::Assertions

class Name 
	
	###############################################################
	# initialize() constructs a Name object from three strings. 
	# Receive: first, middle and last, three strings.
	# Return: the Name, its fields set to first, middle and last. 
	###############################################################

	def initialize(first, middle, last)
       @first, @middle, @last = first, middle, last
    end

    ###############################################################
	# getters/accessors for attributes first, middle and last in Name object.
	###############################################################
    attr_reader :first, :middle, :last

	###############################################################
	# fullName() returns a String containing the first, middle, and
	# 	 		 last names in that order separated by spaces. 
	# PRE: Name object must be initialized.
	# Return: a String representation of the Name object. 
	###############################################################

    def fullName()
    	@first + " " + @middle + " " + @last
    end

	###############################################################
	# print() displays a Name object. 
	# PRE: Name object must be initialized.
	# Output: a String representation of the Name object to the screen.
	# Return: a String representation of the Name object. 
	###############################################################

    def print()
    	puts fullName()
    	return fullName()
    end
end


def testName
   name = Name.new("John", "Paul", "Jones")

   assert name.first == "John", "first failed"
   assert name.middle == "Paul", "middle failed"
   assert name.last == "Jones", "last failed"
   assert name.fullName == "John Paul Jones", "fullName failed"
   assert name.print == "John Paul Jones", "print failed"
   
   print "All tests passed!\n"
end

testName

