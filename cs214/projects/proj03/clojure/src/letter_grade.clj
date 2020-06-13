;;;; letter_grade.clj calculates the letter grade of a student given their average number grade
;;;;
;;;; Input: The average number grade.
;;;; Output: The letter grade of the student.
;;;;
;;;; Usage: clojure -m letter_grade
;;;;
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;;;; Completed by: Advait Scaria
;;;; Date: 02/19/19
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns letter_grade) ; namespace function names the program

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function letterGrade() computes the letter grade of a student.
;;; Receive: average, a number.
;;; Precondition: average >= 0.
;;; Return: the corresponding letter grade of the student.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn letterGrade [average]
  (cond
    (>= average 90) 'A'
    (>= average 80) 'B'
    (>= average 70) 'C'
    (>= average 60) 'D'
    :else 'F'
  )
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Function -main is where execution begins
;;; Input: the average number grade of a student.
;;; Output: the letter grade of the student.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (print "\nEnter the average number grade: ") (flush)
  (let
    [ average (read) ]

    (assert (>= average 0) "-main: grade must be positive")
    (print "\nThe letter grade is: ") (flush)
    (print (letterGrade average))
    (print "\n\n")
  )
)  