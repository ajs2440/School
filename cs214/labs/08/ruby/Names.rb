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
