;; searchlist.clj tests a function to search a list for a given value.
;;
;; Output: four lists, and 
;;          the results of calling a search() function on them.
;;
;; Usage: clojure -m max
;;
;; Begun by: Dr. Adams, CS 214 at Calvin College.
;; Completed by: Advait Scaria
;; Date: 04/23/2019
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(ns searchlist)

(load "listOps")                      ; load module

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Function -main tests function search(). 
;; Output: the results of testing search() on various lists.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defn -main []
  (let
    [ 
      list1 '(99 88 77 66 55)        ; 99 is first value
      list2 (list 55 66 77 88 99)    ; 99 is last value
      list3 (list 55 77 99 88 66)    ; 99 is middle value
      list4 '(5 6 7 8 9)             ; doesn't contain 99
    ]

    (println)																								; print:
    (println "list1: " list1)        ;   list1,
    (println "list2: " list2)        ;   list2,
    (println "list3: " list3)        ;   list3,
    (println "list4: " list4)    				;   list4,
    (println)                        ;   and positions of 99
    (println "Position of 99 in list1: " (search list1 99))
    (println "Position of 99 in list2: " (search list2 99))
    (println "Position of 99 in list3: " (search list3 99))
    (println "Position of 99 in list4: " (search list4 99))
    (println)
  )
)

