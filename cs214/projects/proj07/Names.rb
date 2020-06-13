# Names.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 03/29/2019
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
	# project 7 method
	# setters/mutators for attributes first, middle and last in Name object.
	###############################################################
    attr_writer :first, :middle, :last

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

    ###############################################################
	# project 7 method
	# lfmi() returns a String containing the last name, first name, 
	# 				 and middle initial in that order. 
	# PRE: Name object must be initialized.
	# Return: a String representation of the Name object. 
	###############################################################

    def lfmi()
    	@last + ", " + @first + " " + @middle[0,1] + "."
    end

    ###############################################################
	# project 7 method
	# read() fills Name object info with user input.
	# POST: Valid name inputs read from user input and
    #       Name object filled with input values for
    #       first, middle, and last names.
	# Return: 
	###############################################################
    def readName()
      @first = gets.chomp
      @middle = gets.chomp
      @last = gets.chomp
    end

end


def testName
   name = Name.new("John", "Paul", "Jones")

   assert name.first == "John", "first failed"
   assert name.middle == "Paul", "middle failed"
   assert name.last == "Jones", "last failed"
   assert name.fullName == "John Paul Jones", "fullName failed"
   assert name.print == "John Paul Jones", "print failed"

   # ------ PROJECT 7 TESTS ------

   # set first test
   name.first = "Jake"
   assert name.first == "Jake", "set first failed"

   # set middle test
   name.middle = "Joseph"
   assert name.middle == "Joseph", "set middle failed"

   # set last test
   name.last = "Paul"
   assert name.last == "Paul", "set last failed"

   # lfmi() test
   assert name.lfmi == "Paul, Jake J.", "lfmi() failed"
   
   # readName() test, the name Dawson Alexander Buist must be input to pass
   name.readName
   assert name.first == "Dawson", "read() failed"
   assert name.middle == "Alexander", "read() failed"
   assert name.last == "Buist", "read() failed"

   print "All tests passed!\n"
end

testName

