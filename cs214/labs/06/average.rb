# average.rb averages the values of an array of doubles.
# Precondition: theArray is an array of numbers
# Output: the average of the values in theArray
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 03/07/2019
########################################################

###############################################
# sum() sums the values in an array
# Receive: anArray, an array of numbers
# Return: the sum of the values in anArray.
################################################

def sum(anArray)
	total = 0.0
	anArray.each {| item | total += item}
	return total
end

#############################################################################
# average() is a method that computes the average of the values in an array. 
# Receive: anArray, an array of numbers.								  
# Return: the average of the values in anArray.
#############################################################################

def average(anArray)
	if anArray.empty? then
		return 0.0
	else 
		return sum(anArray)/anArray.size
	end
end

def main

    array0 = Array.new(0)
    array1 = [9.0, 8.0, 7.0, 6.0]

    puts "\nsum 0 is: #{ sum(array0) }\n"
    puts "sum 1 is: #{ sum(array1) }\n"

    puts "\naverage 0 is: #{ average(array0) }\n"
    puts "average 1 is: #{ average(array1) }\n\n"
end

main

