(ns clojure-euler.core
  (:gen-class))


                                        ;2520 is the smallest number that can be divided by each of the
                                        ;numbers from 1 to 10 without any remainder.

                                        ;What is the smallest positive number that is evenly divisible by all
                                        ;of the numbers from 1 to 20?

(defn factors
  "[x] Returns a vector of all prime factors for x, except 1
    e.g., (factors 49); => [7 7]"
  [x]
  (loop [rem x
         i 2
         coll [x]]
    (if (or (= 1 rem) (not (< i (last coll))))
      (massage (into [] coll))
      (do
        (if (= 0 (mod rem i))
          (if (= i (/ rem i))
            (recur (/ rem (* i i)) (inc i) (conj coll i i))
            (recur (/ rem i) i (conj coll i (/ rem i))))
          (recur rem (inc i) coll))))))

(defn divides_cleanly
  "[arg1 arg2] True if the remainder of arg1 / arg2 is 0"
  [arg1 arg2]
  (= 0 (mod arg1 arg2)))

(defn fits
  "[[el & coll]] Makes sure el is not divisible by anything in collection, excluding self
    e.g. [5 2 3 4 5] ;=> true"
  [[ el & coll]]
  (not (some #(and (divides_cleanly el %) (not (= el %))) coll)))

(defn massage
  "[v] Will sort vector and select elements which cannot be divided by any other number
   e.g. [2, 3, 4, 5, 6] => [2, 3, 5]"
  [v]
  (into []  (filter #( fits (into [%] v)) v)))

(defn incr_contender
  "[contender factors] Returns new contender; merge with factors vector.  Something is messed up but its 5pm on Friday so I'm
    returning the max of the original contender and the applied vector.
    e.g. (incr_contender 6 (factors 10)); => 30"
  [contender factors]
  (max (reduce (fn [val el]
            (if (divides_cleanly val el)
              (/ val el)
              (do
                (* val el)
                (* contender el))))
          contender
          factors)
       contender))
  

(defn perform
  "[x] Gets lowest number divisible by all numbers 1 through x
    e.g., (perform 10); => 2720"
  [x]
  (loop [i 2
         contender 1
         term x]
    (if (= i x)
      contender
      (recur (inc i) (incr_contender contender (factors i)) x))))

(perform 20)
; => 232792560
