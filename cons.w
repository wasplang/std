(defn cons [h t]
  (let [pos (malloc (* 2 size_num))]
    (mem_num pos h)
    (mem_num (+ pos size_num) t)
    pos))

(defn head [c]
  (mem_num c))

(defn tail [c]
  (mem_num (+ c size_num)))

(defn is_empty [o] (== o nil) )

(deftest cons_examples
  (is (str_eq "a" (cons "a" nil) "head should be a")))
