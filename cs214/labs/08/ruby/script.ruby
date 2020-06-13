Script started on Fri 05 Apr 2019 02:41:47 PM EDT
ajs244@gold24:~/cs214/labs/08/ruby$ cat *.rb
# Name.rb declares a name class and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/03/2019
####################################################

class Name

  def initialize(first, middle, last)
    @first, @middle, @last = first, middle, last
  end

  attr_reader :first, :middle, :last

  def fullName
    @first + " " + @middle + " " + @last
  end

  def print
    puts fullName
    fullName
  end
  
end
# Names.rb is a module that contains a name class and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/05/2019
####################################################

module Names
  class Name
    
    attr_reader :first, :middle, :last

    def initialize(first, middle, last)
      @first, @middle, @last = first, middle, last
    end

    def fullName
      @first + " " + @middle + " " + @last
    end

    def print
      puts fullName
      fullName
    end

  end
end
# nameTester.rb tests class Name and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/05/2019
####################################################

require 'test/unit/assertions'
include Test::Unit::Assertions

require './Names.rb'
include Names

def testName
   name = Name.new("John", "Paul", "Jones")

   assert name.first == "John", 
           "first failed"
   assert name.middle == "Paul",
           "middle failed"
   assert name.last == "Jones",
           "last failed"
   assert name.fullName == "John Paul Jones",
           "fullName failed"
   assert name.print == "John Paul Jones",
           "print failed"
   
   print "All tests passed!\n"
end

testName

ajs244@gold24:~/cs214/labs/08/ruby$ ruby nameTester.rb
John Paul Jones
All tests passed!
ajs244@gold24:~/cs214/labs/08/ruby$ exit

Script done on Fri 05 Apr 2019 02:42:31 PM EDT
