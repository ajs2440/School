Script started on Tue 19 Feb 2019 03:07:32 PM EST
ajs244@maroon02:~/cs214/projects/proj03$ clojure -m letter_grade[Kruby letter_grade.rb                    cat letter_grade.rb
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
endajs244@maroon02:~/cs214/projects/proj03$ ruby cat letter_grade.rblojure -m letter_grade[4Pat letter_grade.rbruby [Kletter_grade.rb
Enter the average number grade: 100
The letter grade is: A
ajs244@maroon02:~/cs214/projects/proj03$ ruby letter_grade.rb
Enter the average number grade: 90
The letter grade is: A
ajs244@maroon02:~/cs214/projects/proj03$ ruby letter_grade.rb
Enter the average number grade: 89
The letter grade is: B
ajs244@maroon02:~/cs214/projects/proj03$ ruby letter_grade.rb
Enter the average number grade: 80
The letter grade is: B
ajs244@maroon02:~/cs214/projects/proj03$ ruby letter_grade.rb
Enter the average number grade: 79
The letter grade is: C
ajs244@maroon02:~/cs214/projects/proj03$ ruby letter_grade.rb
Enter the average number grade: 70
The letter grade is: C
ajs244@maroon02:~/cs214/projects/proj03$ ruby letter_grade.rb
Enter the average number grade: 69
The letter grade is: D
ajs244@maroon02:~/cs214/projects/proj03$ ruby letter_grade.rb
Enter the average number grade: 60
The letter grade is: D
ajs244@maroon02:~/cs214/projects/proj03$ ruby letter_grade.rb
Enter the average number grade: 59
The letter grade is: F
ajs244@maroon02:~/cs214/projects/proj03$ ruby letter_grade.rb
Enter the average number grade: 0
The letter grade is: F
ajs244@maroon02:~/cs214/projects/proj03$ exit

Script done on Tue 19 Feb 2019 03:09:01 PM EST
