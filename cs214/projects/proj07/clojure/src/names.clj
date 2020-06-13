;;;; names.clj creates and tests a clojure Name type.
;;;;
;;;; Output: results of testing Name functions.
;;;;
;;;; Usage: clojure -m names
;;;;
;;;; Begun by: Dr. Adams, CS 214 at Calvin College.
;;;; Completed by: Advait Scaria
;;;; Date: 04/02/2019
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns names)   ; program name

;;; define a Clojure record named Name 
;;; (which compiles to a Java class).

(defrecord Name [firstName middleName lastName])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; make-Name constructs a Name from three strings. 
;;; Receive: firstN, middleN and lastN, three strings.
;;; Return: the Name (firstN middleN lastN). 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn make-Name [first middle last]
	(->Name first middle last)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getFirst() extracts the first name of a Name object.
;;; Receive: aName, a Name.
;;; Return: the firstName string in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defn getFirst [^Name aName]
	(:firstName aName)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; project 7 method
;;; setFirst() sets the first name of a Name object.
;;; Receive: aName, a Name & newF, a String.
;;; POST: set firstName equal to newF.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn setFirst [^Name aName newF]
  (->Name newF (:middleName aName) (:lastName aName))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getMiddle() extracts the middle name of a name object.
;;; Receive: aName, a Name. 
;;; Return: the middleName string in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defn getMiddle [^Name aName]
	(:middleName aName)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; project 7 method
;;; setMiddle() sets the middle name of a Name object.
;;; Receive: aName, a Name & newM, a String.
;;; POST: set middleName equal to newM.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn setMiddle [^Name aName newM]
  (->Name (:firstName aName) newM (:lastName aName))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; getLast() extracts the last name of a name object.
;;; Receive: aName, a Name. 
;;; Return: the lastName string in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defn getLast [^Name aName]
	(:lastName aName)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; project 7 method
;;; setLast() sets the last name of a Name object.
;;; Receive: aName, a Name & newL, a String.
;;; POST: set lastName equal to newL.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn setLast [^Name aName newL]
  (->Name (:firstName aName) (:middleName aName) newL)
)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; toString() returns a full name in F-M-L order. 
;;; Receive: aName, a Name. 
;;; Return: firstName, middleName, lastName,
;;;           separated by spaces. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defn toString [^Name aName]
	(str (getFirst aName) " " (getMiddle aName) " " (getLast aName))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; printName() displays a name object.
;;; Receive: aName, a Name.
;;; Output: the strings in aName.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defn printName [^Name aName]
	(print (toString aName))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; project 7 method
;;; toString() returns a full name in F-M-L order. 
;;; Receive: aName, a Name. 
;;; Return: firstName, middleName, lastName,
;;;           separated by spaces. 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defn lfmi [^Name aName]
	(str (getLast aName) ", " (getFirst aName) " " (get (getMiddle aName) 0) ".")
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; project 7 method
;;; read() reads name inputs and populates name object with valid inputs. 
;;; Receive: aName, a Name. 
;;; POST: Valid name inputs read from user input and
;;;       Name object filled with input values for
;;;       first, middle, and last names.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 
(defn readInput []
		(do (print "Enter the full name: ") (flush)
			(let 
				[
					myFirst (str (read))
					myMiddle (str (read))
					myLast (str (read))
				]
				(->Name myFirst myMiddle myLast)
			)
		)
) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; A simple driver to test our Name functions. 
;;; Output: the result of testing our Name functions.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (let
    [                                          ; 3 ways to construct an object:
      name1 (make-Name "John" "Paul" "Jones")  ; -using our "make-" constructor
      name2 (->Name "Jane" "Penelope" "Jones") ; -invoking constructor directly
                                               ; -mapping field-names to values
      name3 (map->Name {:lastName "Jones" :firstName "Jinx" :middleName "Joy"})

      name4 (setFirst name1 "Jake")												; 3 new names objects set for testing setters
    		name5 (setMiddle name4 "Joseph")
    		name6 (setLast name5 "Paul")

    		name7 (readInput)
    ]
    ;; ----- SECTION 1 -----
    (println)
    (print name1) (println)
    (assert (= (getFirst name1) "John") "getFirst(1) failed")
    (assert (= (getMiddle name1) "Paul") "getMiddle(1) failed")
    (assert (= (getLast name1) "Jones") "getLast(1) failed")
    (assert (= (toString name1) "John Paul Jones") "toString(1) failed")
    (printName name1) (println)
    ;; ----- SECTION 2 -----
    (println)
    (print name2) (println)
    (assert (= (getFirst name2) "Jane") "getFirst(2) failed")
    (assert (= (getMiddle name2) "Penelope") "getMiddle(2) failed")
    (assert (= (getLast name2) "Jones") "getLast(2) failed")
    (assert (= (toString name2) "Jane Penelope Jones") "toString(2) failed")
    (printName name2) (println)
    ;; ----- SECTION 3 -----
    (println)
    (print name3) (println)
    (assert (= (getFirst name3) "Jinx") "getFirst(3) failed")
    (assert (= (getMiddle name3) "Joy") "getMiddle(3) failed")
    (assert (= (getLast name3) "Jones") "getLast(3) failed")
    (assert (= (toString name3) "Jinx Joy Jones") "toString(3) failed")
    (printName name3) (println)

    ;; ----- PROJECT 7 METHODS' TESTS -----

    ;; setFirst(), setMiddle(), setLast() tests
    (assert (= (getFirst name4) "Jake") "setFirst() failed")
    (assert (= (getMiddle name5) "Joseph") "setMiddle() failed")
    (assert (= (getLast name6) "Paul") "setLast() failed")
    (println) (print "PROJECT 7 METHODS' TESTS BELOW: ") (println)
    (printName name4) (println)
    (printName name5) (println)
    (printName name6) (println)

    ;; lfmi() test
    (assert (= (lfmi name6) "Paul, Jake J.") "lfmi() failed")

    ;; read() test -- the name Dawson Alexander Buist must be input when initializing test7 through read() in let[]
    (println)
    (assert (= (getFirst name7) "Dawson") "read() failed")
    (assert (= (getMiddle name7) "Alexander") "read() failed")
    (assert (= (getLast name7) "Buist") "read() failed")
    (printName name7) (println)

    (println "\nAll tests passed!\n")
  )
)

