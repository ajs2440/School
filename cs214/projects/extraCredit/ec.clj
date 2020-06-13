;;;; ec.clj defines and tests reverse functions.
;;;;
;;;; Input: 
;;;; Precondition: 
;;;; Output: 
;;;;
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;;;; Completed by: Advait Scaria
;;;; Date: 04/30/2019
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns ec)                                 ; name the program

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; my-reverse() recursively reverses top-level elements in a 
;;; 													given list.
;;; Receive: aList
;;; Precondition: 
;;; Output: 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn my-reverse [list]
	(if (list? list)
		(if (empty? list)
			nil
			(let `)
		)
		nil
	)
)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; -main is a 'driver' for the functions defined above.
;;; Input: 
;;; Output: 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn -main []
 (my-reverse '(a b (c d) (e (f g))))
)

