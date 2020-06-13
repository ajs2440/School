;;;; roots.clj computes the roots of an input quadratic equation.
;;;;
;;;; Input: a, b, c - coefficients of the quadratic equation.
;;;; Output: The 2 roots of the quadratic equation, if any.
;;;;
;;;; Usage: clojure -m split
;;;;
;;;; Begun by: Dr. Adams, for CS 214 at Calvin College.
;;;; Completed by: Advait Scaria
;;;; Date: 03/07/2019
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns roots)      ; name the program

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; quadraticRoots() computes the roots of a quadratic equation. 
;;; Receive: a, b, c - coefficients of type double.
;;; PRE: a, b, c must be valid numbers.
;;; Return: a vector containing the roots of the equation
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn quadraticRoots [a b c]
    (if (= a 0) (print "\n\ta is zero!\n\n"))
    (if (not= a 0) 
        (let [arg (- (* b b) (* (* 4 a) c))] 
        (if (< arg 0) (print "\n\tb^2 - 4ac is negative!\n\n"))
          (if (>= arg 0)
            (let [
              root1 (/ (+ (* b -1) (Math/sqrt arg)) (* 2 a))
              root2 (/ (- (* b -1) (Math/sqrt arg)) (* 2 a)) 
              ]
              (vector root1 root2)
            )        
          )
        )
		)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; main function
;;; Input: a, b, c - the coefficients of the quadratic equation.
;;; Output: the two roots of the quadratic equation if any.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (print "To compute the roots enter the values of the coefficients: ") (flush)
  
  (print "\n\ta = ") (flush)
  (let [ a (read) ]
    (print "\tb = ") (flush)
    (let [ b (read) ]
      (print "\tc = ") (flush)
      (let [ c (read) ]
        (let 
          [                                
            rootsList (quadraticRoots a b c)
            root1 (get rootsList 0)
            root2 (get rootsList 1)
          ]                                       
          (if (and (not= root1 nil) (not= root2 nil))
            (print "\nthe first root is:" root1 
              "\nthe second root is:" root2 "\n\n"
            )
            (print "")   
          )
        )
      )
    )
  )
)
