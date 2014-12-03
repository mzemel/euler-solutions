(ns clojure-euler.core
  (:gen-class))

(defn -main
  [& args]
)

; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
; Find the sum of all the multiples of 3 or 5 below 1000.

(defn first_problem
  []
  (loop [iteration 1 numbers []]
    (if (> 1000 iteration)
      (do
        (if (or (= (mod iteration 3) 0) (= (mod iteration 5) 0))
          (recur (inc iteration) (conj numbers iteration))
          (recur (inc iteration) numbers)))
      (do
        (println  (reduce + numbers))
        (println iteration)))))
