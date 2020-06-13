;; temperature.clj is a module for the 'Temperature' type-abstraction.
;;
;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;; Completed by: Advait Scaria
;; Date: 04/11/2019
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require '[clojure.string :as str])
;; Create a record/struct type named Temperature
(defrecord Temperature [myDegree myScale])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; isValid checks if a Temperature object is valid. 
;; Receive: degree, a float;
;; 									scale, a character.
;; Return: true if Temperature type is valid, false otherwise.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn isValid [degree scale]
		(cond
				(= \F scale) (if (< degree -459.67) false true)
				(= \f scale) (if (< degree -459.67) false true)
				(= \C scale) (if (< degree -273.15) false true)
				(= \c scale) (if (< degree -273.15) false true)
				(= \K scale) (if (< degree 0.0) false true)
				(= \k scale) (if (< degree 0.0) false true)
				:else true
		)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; make-Temperature constructs a Temperature object from given 
;; 																	degree and scale. 
;; Receive: degree, a float;
;; 									scale, a character.
;; Return: the Temperature (degree scale). 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn make-Temperature [degree scale]
  (if (isValid degree scale) 
  		(->Temperature degree scale)
  		(println "Invalid Input")
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; getMyDegree extracts the degree of a Temperature object.
;; Receive: aTemp, a Temperature.
;; Return: myDegree of aTemp.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn getMyDegree [^Temperature aTemp]
  (:myDegree aTemp)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; getMyScale extracts the scale of a Temperature object.
;; Receive: aTemp, a Temperature.
;; Return: myScale of aTemp.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn getMyScale [^Temperature aTemp]
  (:myScale aTemp)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; getInF gives a Temperature in equivalent degrees F scale
;; PRE: Temperature object which this message is sent to has
;; 					been initialized.  
;; Receive: aTemp, a Temperature.
;; Return: a Temperature object in degrees F scale.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn getInF [^Temperature aTemp]
  (cond
				(= \F (getMyScale aTemp)) (make-Temperature (getMyDegree aTemp) \F)
				(= \f (getMyScale aTemp)) (make-Temperature (getMyDegree aTemp) \F)
				(= \C (getMyScale aTemp)) (make-Temperature (+ (* (/ 9.0 5.0) (getMyDegree aTemp)) 32.0) \F)
				(= \c (getMyScale aTemp)) (make-Temperature (+ (* (/ 9.0 5.0) (getMyDegree aTemp)) 32.0) \F)
				(= \K (getMyScale aTemp)) (make-Temperature (+ (* (/ 9.0 5.0) (- (getMyDegree aTemp) 273.15)) 32.0) \F)
				(= \k (getMyScale aTemp)) (make-Temperature (+ (* (/ 9.0 5.0) (- (getMyDegree aTemp) 273.15)) 32.0) \F)
				:else false
		)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; getInC gives a Temperature in equivalent degrees C scale
;; PRE: Temperature object which this message is sent to has
;; 					been initialized.  
;; Receive: aTemp, a Temperature.
;; Return: a Temperature object in degrees C scale.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn getInC [^Temperature aTemp]
  (cond
				(= \F (getMyScale aTemp)) (make-Temperature (* (/ 5.0 9.0) (- (getMyDegree aTemp) 32.0)) \C)
				(= \f (getMyScale aTemp)) (make-Temperature (* (/ 5.0 9.0) (- (getMyDegree aTemp) 32.0)) \C)
				(= \C (getMyScale aTemp)) (make-Temperature (getMyDegree aTemp) \C)
				(= \c (getMyScale aTemp)) (make-Temperature (getMyDegree aTemp) \C)
				(= \K (getMyScale aTemp)) (make-Temperature (- (getMyDegree aTemp) 273.15) \C)
				(= \k (getMyScale aTemp)) (make-Temperature (- (getMyDegree aTemp) 273.15) \C)
				:else false
		)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; getInK gives a Temperature in equivalent degrees K scale
;; PRE: Temperature object which this message is sent to has
;; 					been initialized.  
;; Receive: aTemp, a Temperature.
;; Return: a Temperature object in degrees K scale.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn getInK [^Temperature aTemp]
  (cond
				(= \F (getMyScale aTemp)) (make-Temperature (* (/ 5.0 9.0) (+ (getMyDegree aTemp) 459.67)) \K)
				(= \f (getMyScale aTemp)) (make-Temperature (* (/ 5.0 9.0) (+ (getMyDegree aTemp) 459.67)) \K)
				(= \C (getMyScale aTemp)) (make-Temperature (+ (getMyDegree aTemp) 273.15) \K)
				(= \c (getMyScale aTemp)) (make-Temperature (+ (getMyDegree aTemp) 273.15) \K)
				(= \K (getMyScale aTemp)) (make-Temperature (getMyDegree aTemp) \K)
				(= \k (getMyScale aTemp)) (make-Temperature (getMyDegree aTemp) \K)
				:else false
		)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; readTemp reads Temperature object values from input.
;; Return: an initialized Temperature object based on input.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn readTemp []
		(println "(Enter the temperature in the format --- degrees, scale): ")
		(let 
				[
				  inputStr (read-line) 
				  splitStr1 (str/split inputStr #" ")
				  deg (Float/parseFloat (first splitStr1))
				  sc (get (second splitStr1) 0)
				]
				(make-Temperature deg sc)
		)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; displayTemp outputs Temperature object values.
;; PRE: Temp has been initialized.
;; Receive: Temp, a Temperature.
;; Output: Temp.myDegree & Temp.myScale output to console.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn displayTemp [^Temperature aTemp]
		(print (format "%.5f"(getMyDegree aTemp)) " " (getMyScale aTemp))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; raise raises myDegree by degree amount.
;; PRE: Temp has been initialized, degrees > 0.
;; Receive: Temp, a Temperature;                            
;;          degree, a Float
;; Output: Temperature object with raised myDegree. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn raise [^Temperature aTemp degree]
		(if (> degree 0.0) (make-Temperature (+ (getMyDegree aTemp) degree) (getMyScale aTemp))
						(print "Please enter a degree greater than 0 to raise the temperature by!")
		)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; lower lowers myDegree by degree amount.
;; PRE: Temp has been initialized, degrees > 0.
;; Receive: Temp, a Temperature;                            
;;          degree, a Float
;; Output: Temperature object with lowered myDegree. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn lower [^Temperature aTemp degree]
		(if (> degree 0.0) 
						(if (isValid (- (getMyDegree aTemp) degree) (getMyScale aTemp)) 
										(make-Temperature (- (getMyDegree aTemp) degree) (getMyScale aTemp))
										(make-Temperature (getMyDegree aTemp) (getMyScale aTemp))
						)
				  (print "Please enter a degree greater than 0 to raise the temperature by!")
		)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; equals compares the degrees of two Temperature objects.
;; PRE: both temp1 and temp2 have been initialized.
;; Receive: temp1, a Temperature;                           
;;          temp2, a Temperature. 
;; Return: true if they have equaivalent degrees, false
;;         otherwise.  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn equals [^Temperature temp1 ^Temperature temp2]
		(if (= (getMyDegree (getInF temp1)) (getMyDegree (getInF temp2))) true false) 
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; lessThan compares the degrees of two Temperature objects.
;; PRE: both temp1 and temp2 have been initialized.
;; Receive: temp1, a Temperature;                           
;;          temp2, a Temperature. 
;; Return: true if temp1 is less than temp2, false otherwise. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn lessThan [^Temperature temp1 ^Temperature temp2]
		(if (< (getMyDegree (getInF temp1)) (getMyDegree (getInF temp2))) true false)
)

