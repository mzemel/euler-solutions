(ns clojure-euler.core
  (:gen-class))

(defn -main
  [& args]
)

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
