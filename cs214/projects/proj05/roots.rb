# roots.rb computes the roots of a given quadratic equation.
#
# Input: a, b, c - coefficients of the quadratic equation.
# Precondition: valid numbers of type double for coefficient inputs.
# Output: The 2 roots of the quadratic equation, if any.
#
# Begun by: Prof. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 03/07/2019
#################################################################


# quadraticRoots() computes the roots of a quadratic equation.
# Receive: a, b, c - coefficients of type double.                  
# PRE: a, b, c must be valid numbers.
# Return: an array containing values of the 2 roots, 
# 			both roots are 0.0 if the quadratic equation 
# 			doesn't contain any real roots. 
######################################################

def quadraticRoots(a, b, c)
	if a!= 0.0 then
		arg = b**2 - 4 * a * c
		if arg >= 0.0 then
			root1 = (-b + Math.sqrt(arg))/(2 * a)
			root2 = (-b - Math.sqrt(arg))/(2 * a)
		else
			root1 = root2 = 0.0
			puts "\n\tb^2 - 4ac is negative!\n\n"
		end
	else
		root1 = root2 = 0.0
		puts "\n\ta is zero!\n\n"
	end
	[root1, root2]
end


def main
  puts "To compute the roots enter the values of the coefficients: "
  
  print "\ta = "
  a = gets.to_f
  print "\tb = "
  b = gets.to_f
  print "\tc = "
  c = gets.to_f
  
  rootsList = quadraticRoots(a, b, c)
  
  if rootsList[0] != 0.0 and rootsList[1] != 0.0 then
	  puts
	  puts "\tthe first root is: " << rootsList[0].to_s
	  puts "\tthe second root is: " << rootsList[1].to_s
	  puts
  end

end


main
