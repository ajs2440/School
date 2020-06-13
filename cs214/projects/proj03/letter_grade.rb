#! /usr/bin/ruby
# letter_grade.rb computes the letter grade of a student given the average number grade
# 
# Input: the average number grade out of 100.
# Precondition: the number grade is >= 0.
# Output: the letter grade of that student.
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 02/19/19
###############################################################

# function letterGrade returns a student's letter grade, given their number grade 
# Parameters: average, a number.
# Precondition: average >= 0.
# Returns: the corresponding letter grade of the student.
def letterGrade(average)
    case average
    	when 90..100 then
    		return 'A'
    	when 80..89 then
    		return 'B'
    	when 70..79 then
    		return 'C'
    	when 60..69 then
    		return 'D'
    	else
    		return 'F'  	
    end
end

if __FILE__ == $0
   print "Enter the average number grade: "
   average = gets.chomp.to_f
   print "The letter grade is: "
   puts letterGrade(average)
end