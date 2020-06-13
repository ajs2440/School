;;;; Owl.clj provides an Owl "class".
;;;; 
;;;; Begun by: Prof. Adams, for CS 214 at Calvin College.
;;;; Completed by: Advait Scaria
;;;; Date: 04/23/2019s
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
;; bring in 'Bird' (to be used as superclass) 
(load "Bird")

;; define 'Owl' as 'subclass' of Bird
(defrecord Owl [^Bird name] )

;;; constructors
;;; - default: takes no arguments
;;;   Postcondition: name is initialized to a default value
;;; - explicit: takes one parameter
;;;   Receive: itsName, a String
;;;   Postcondition: name == itsName
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn make-Owl
  ([]                (->Owl "Ann Onymous"))
  ([^String itsName] (->Owl itsName))
)

;;; method to retrieve a Owl's class
;;; Receive: this, an Owl object.
;;; Return: "Owl"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmethod getClass Owl [ _ ]
  "Owl"
)

;;; method to retrieve a Owl's call
;;; Receive: this, an Owl object.
;;; Return: "Whoo-hoo!"
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defmethod getCall Owl [ _ ]
  "Whoo-hoo!"
)

