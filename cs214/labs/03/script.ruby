Script started on Wed 13 Feb 2019 03:45:19 PM EST
ajs244@gold22:~/cs214/labs/03$ cat year_codes/.rb    /rb   .rb
#! /usr/bin/ruby
# year_codes.rb translates an academic year into a numeric code
#
# Begun by: Dr. Nelesen, for CS 214 at Calvin College 
# Completed by: Advait Scaria
# Date: 02/13/2019
#
################################################################

# Input:  The name of an academic year
# Precondition: The academic year is a string with a value of freshman, 
#   sophomore, junior or senior
# Output: The corresponding integer code for the given academic year

def yearCode(year)
	if year =~ /freshman/ then
		return 1
	elsif year =~ /sophomore/ then
		return 2
	elsif year =~ /junior/ then
		return 3
	elsif year =~ /senior/ then
		return 4
	else 
		return 0
	end
end 

if __FILE__ == $0
   print "Enter the year: "
   year = gets
   print "Numeric code is: "
   puts yearCode(year)
end

ajs244@gold22:~/cs214/labs/03$ ruby year_codes.rb
Enter the year: freshman
Numeric code is: 1
ajs244@gold22:~/cs214/labs/03$ ruby year_codes.rb
Enter the year: sophomore
Numeric code is: 2
ajs244@gold22:~/cs214/labs/03$ ruby year_codes.rb
Enter the year: junior
Numeric code is: 3
ajs244@gold22:~/cs214/labs/03$ ruby year_codes.rb
Enter the year: senior
Numeric code is: 4
ajs244@gold22:~/cs214/labs/03$ ruby year_codes.rb
Enter the year: lolwut
Numeric code is: 0
ajs244@gold22:~/cs214/labs/03$ ruby year_codes.rb
Enter the year: idk
Numeric code is: 0
ajs244@gold22:~/cs214/labs/03$ exit

Script done on Wed 13 Feb 2019 03:46:16 PM EST
