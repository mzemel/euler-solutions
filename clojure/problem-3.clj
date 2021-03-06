(ns clojure-euler.core
  (:gen-class))

                                        ;The prime factors of 13195 are 5, 7, 13 and 29.
                                        ;What is the largest prime factor of the number 600851475143 ?


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

(defn factors
  "[t] Returns vector of all factors for target, not unique or ordered"
  [t]
  (loop [primes []
         highest t
         iteration 2]
    (if (< highest iteration)
      (apply max (massage primes))
      (do
        (if (divides_cleanly t iteration)
          (recur (concat primes [iteration (/ t iteration)]) (/ t iteration) (inc iteration))
          (recur primes t (inc iteration)))))))

(factors 600851475143)
; => 6857