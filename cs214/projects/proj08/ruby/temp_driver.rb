# temp_driver.rb tests class Temperature and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/11/2019
####################################################

require 'test/unit/assertions'
include Test::Unit::Assertions

require './temperature.rb'
include Temperatures

def temp_driver
  
  baseTemp = Temperature.new(0.0, 'K')
  limitTemp = Temperature.new(0.0, 'K')

  print "baseTemp "
  baseTemp = baseTemp.readTemp()

  print "limitTemp "
  limitTemp = limitTemp.readTemp()

  print "stepValue: "
  stepValue = gets.chomp.to_f 

  puts "\n"
  puts "\t Fahrenheit\t\t Celsius\t\tKelvin"
  puts "\n"
  # tempStepValue = 0.0
  while (baseTemp.lessThan(limitTemp) or baseTemp.equals(limitTemp) )
    baseTemp.getInF().displayTemp()
    baseTemp.getInC().displayTemp()
    baseTemp.getInK().displayTemp()
    puts "\n"
    baseTemp = baseTemp.raiseTemp(stepValue)
  end
  puts "\n"
end

temp_driver

