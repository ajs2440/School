#! /usr/bin/ruby
# factorial.rb computes the factorial of a given number
# 
# Input: the integer n.
# Precondition: the integer is >= 0.
# Output: the factorial of that integer n.
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 02/22/2019
###############################################################

# function factorial returns the factorial of integer n
# Parameters: n, an integer.
# Precondition: n >= 0.
# Returns: n factorial.
def factorial(n)
    answer = 1
    if n>= 0
      for i in 2..n
        answer = answer * i
      end
    else return -1  # error condition, n not >= 0
    end
    return answer
end

if __FILE__ == $0
   print "To compute n!, enter n: "
   n = gets.chomp.to_i
   print n
   print "! = "
   puts factorial(n)
end
