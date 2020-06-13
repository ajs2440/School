# temperature.rb is a module that contains a temperature class and its operations
#
# Begun by: Dr. Adams, for CS 214 at Calvin College.
# Completed by: Advait Scaria
# Date: 04/05/2019
####################################################

module Temperatures
  class Temperature
    
  ###################################################################
  # isValid() checks whether a Temperature type is valid          
  # Receive: degrees, myDegree Float;
  #          scale, myScale Character.         
  # Return: true if Temperature type is valid, false otherwise.     
  ###################################################################
    def isValid(degree, scale)
      if scale == 'F' or scale == 'f'
        if degree < -459.67
          puts "Invalid Fahrenheit Degree"
          return false
        else
          return true
        end
      elsif scale == 'C' or scale == 'c'
        if degree < -273.15
          puts "Invalid Celsius Degree"
          return false
        else
          return true
        end
      elsif scale == 'K' or scale == 'k'
        if degree < 0.0
          puts "Invalid Kelvin Degree"
          return false
        else
          return true
        end
      else
        puts "Invalid Input"
        return false 
      end
    end

    ###################################################################
    # Temperature accessors - retrieves Temperature.myDegree & Temperature.myScale
    ###################################################################
    attr_reader :myDegree, :myScale

    ###################################################################
    # isValid() checks whether a Temperature type is valid          
    # Receive: degrees, myDegree Float;
    #          scale, myScale Character.         
    # Return: true if Temperature type is valid, false otherwise.     
    ###################################################################
    def initialize(degree, scale)
      if isValid(degree, scale)
        @myDegree, @myScale = degree, scale
      end
    end

    ###################################################################
    # getInF gives a Temperature in equivalent degrees F scale         
    # PRE: Temperature object which this message is sent to has
    #      been initialized.     
    # Return: a Temperature object in degrees F scale.     
    ###################################################################
    def getInF()
      if @myScale == 'F' or @myScale == 'f'
        return self
      else
        degreeF = 0.0
        if @myScale == 'C' or @myScale == 'c'
          degreeF = ((9.0/5.0) * @myDegree) + 32.0
        else
          degreeF = (@myDegree - 273.15) * (9.0/5.0) + 32.0
        end
        myTemp = Temperature.new(degreeF, 'F')
        return myTemp
      end
    end

    ###################################################################
    # getInC gives a Temperature in equivalent degrees C scale         
    # PRE: Temperature object which this message is sent to has
    #      been initialized.     
    # Return: a Temperature object in degrees C scale.     
    ###################################################################
    def getInC()
      if @myScale == 'C' or @myScale == 'c'
        return self
      else
        degreeC = 0.0
        if @myScale == 'F' or @myScale == 'f'
          degreeC = (5.0/9.0) * (@myDegree - 32.0)
        else
          degreeC = @myDegree - 273.15;
        end
        myTemp = Temperature.new(degreeC, 'C')
        return myTemp
      end
    end

    ###################################################################
    # getInK gives a Temperature in equivalent degrees K scale         
    # PRE: Temperature object which this message is sent to has
    #      been initialized.     
    # Return: a Temperature object in degrees K scale.     
    ###################################################################
    def getInK()
      if @myScale == 'K' or @myScale == 'k'
        return self
      else
        degreeK = 0.0
        if @myScale == 'F' or @myScale == 'f'
          degreeK = (5.0/9.0) * (@myDegree + 459.67);
        else
          degreeK = @myDegree + 273.15;
        end
        myTemp = Temperature.new(degreeK, 'K')
        return myTemp
      end
    end

    ###################################################################
    # readTemp reads Temperature object values from input.          
    # PRE: Temp has been initialized.
    # POST: my Temperature object changed with input values if valid.     
    ###################################################################
    def readTemp()
       print "(Enter the temperature in the format --- degrees, scale): "
       inputStr = gets.split
       degree = inputStr[0].to_f
       scale = inputStr[1].to_s

       return Temperature.new(degree, scale)
    end

    ###################################################################
    # displayTemp() outputs Temperature object values.          
    # PRE: Temp has been initialized.        
    # Output: Temp.myDegree & Temp.myScale output to console.       
    ###################################################################
    def displayTemp()
       print "\t" + '%.5f' % @myDegree + " " + @myScale + "\t"
    end

    ###################################################################
    # raiseTemp raises myDegree by degrees amount.      
    # PRE: Temp has been initialized, degrees > 0.          
    # Returns: self or newTemp, a myScale scale Temperature object with
    #          myDegree = myDegree + degrees.       
    ###################################################################
    def raiseTemp(degrees)
      if degrees >= 0.0
        return Temperature.new(@myDegree + degrees, @myScale)
        
      else
        puts "Please enter a degree greater than 0 to raise the temperature by!"
        return self
      end
    end

    ###################################################################
    # lower lowers myDegree by degrees amount.      
    # PRE: Temp has been initialized, degrees > 0.          
    # Returns: self or newTemp, a myScale scale Temperature object with
    #          myDegree = myDegree + degrees.       
    ###################################################################
    def lower(degrees)
      if degrees >= 0.0
        if isValid(@myDegree - degrees, @myScale)
          newTemp = Temperature.new(@myDegree - degrees, @myScale)
          return newTemp
        else
          return self
        end
      else
        puts "Please enter a degree greater than 0 to raise the temperature by!"
        return self
      end
    end

    ###################################################################
    # equals compares the degrees of two Temperature objects.      
    # PRE: Temp has been initialized, degrees > 0.          
    # Returns: self or newTemp, a myScale scale Temperature object with
    #          myDegree = myDegree + degrees.       
    ###################################################################
    def equals(aTemp)
      temp1 = self.getInF()
      temp2 = aTemp.getInF()
      return temp1.myDegree == temp2.myDegree
    end

    ###################################################################
    # lessThan compares the degrees of two Temperature objects    
    # PRE: Temp has been initialized, degrees > 0.          
    # Returns: true if temp1 is less than temp2, false otherwise.      
    ###################################################################
    def lessThan(aTemp)
      temp1 = self.getInF()
      temp2 = aTemp.getInF()
      return temp1.myDegree < temp2.myDegree
    end

  end
end
