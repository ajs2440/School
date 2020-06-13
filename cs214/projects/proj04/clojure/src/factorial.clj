;;;; factorial.clj calculates the factorial of a given integer
;;;;
;;;; Input: The integer.
;;;; Output: The factorial of integer.
;;;;
;;;; Usage: clojure -m factorial
;;;;
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;;;; Completed by: Advait Scaria
;;;; Date: 02/22/2019
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns factorial) ; namespace function names the program

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function factorial() computes the factorial of integer n.
;;; Receive: n, an integer.
;;; Precondition: n >= 0.
;;; Return: the factorial of n.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn factorial [n]
  (if (>= n 0)
    (if (< n 2) 1
      (* n (factorial (- n 1)))
    )
    -1  ; error condition, n not >= 0 
  )

)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -main is where execution begins
;;; Input: the integer n.
;;; Output: the factorial of n.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (print "\nTo compute n!, enter n: ") (flush)
  (let
    [ n (read) ]

    (print n)
    (print "! = ") (flush)
    (print (factorial n))
    (print "\n\n")
  )
)  
