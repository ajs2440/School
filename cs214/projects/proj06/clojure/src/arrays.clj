;; arrays.clj is a driver for reading and printing arrays.
;;
;; Usage: clojure -m average
;;
;; Begun by: Dr. Adams, CS 214 at Calvin College.
;; Completed by: Advait Scaria
;; Date: 03/15/2019
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns arrays)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; readArray() is a method that reads the inputted elements and 
;;                fills anArray with those elements.       
;; Receive: anArray, an array od double elements.
;; 									size, type int - specifies anArray's size.
;; Postcondition: Reads valid element inputs from console and 
;;                populates anArray with them.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn readArray [anArray size]
			(loop [i 0]
				(when (< i size)
					(print "Enter element: ")
					(let [ element (double (read)) ]
						(aset anArray i element)
					)
					(recur (+ i 1))
				)
			)	
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; printArray() is a method that reads the inputted elements and 
;;                fills anArray with those elements.       
;; Receive: anArray, an array with double elements
;; 									size, type int - specifies anArray's size.
;; Postcondition: Prints the elements in anArray to console.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn printArray [anArray size]
	(loop [i 0]
		(when (< i size)
			(print (aget anArray i)) (flush)
			(recur (+ i 1))
		)
	)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; main function to test functions readArray() and printArray().
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (print "Enter the size of the array: ")
  	(let
  		[size (read)
  		 anArray (double-array size)]
  	 (readArray anArray size)
  		(print "Here are the elements of your array: ")
  		(printArray anArray size)
  	)
)