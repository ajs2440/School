;; temp_driver.clj tests a Clojure Temperature type,
;;  stored in temperature.clj (in the src directory).
;;
;; Output: the results of testing the Temperature functions.
;;
;; Usage: clojure -m temp_driver
;;
;; Begun by: Prof. Adams, CS 214 at Calvin College.
;; Completed by: Advait Scaria
;; Date: 04/11/2019
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns temp_driver)

;;(load "Name")
(load-file "src/temperature.clj")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; A simple driver to test Temperature functions. 
;; Output: the results of testing Temperature functions.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (let
    [
    		baseTemp (readTemp)
    		limitTemp (readTemp)
    ]
    (println "Enter stepValue: ")
    (let [ stepValue (read) ]
    		(newline) (println "      Fahrenheit          Celsius         Kelvin") (newline)
		    (loop [i stepValue]
		    		(when (or (lessThan (raise baseTemp i) limitTemp)
		    	          (equals (raise baseTemp i) limitTemp))
		    				(print "     ")
                (displayTemp (getInF (raise baseTemp i)))
                (print "     ")
                (displayTemp (getInC (raise baseTemp i)))
                (print "     ")
                (displayTemp (getInK (raise baseTemp i)))
                (println)
 		    			  (recur (+ i stepValue))
		    		);closes when 
		    ); closes loop
		  ) 
  )
)


