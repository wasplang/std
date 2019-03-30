(def nil 0)

(defn cons [h t]
  (let [pos (malloc (* 2 SIZE_NUM))]
    (mem_num pos h)
    (mem_num (+ pos SIZE_NUM) t)
    pos))

(defn head [c]
  (mem_num c))

(defn tail [c]
  (mem_num (+ c SIZE_NUM)))

(defn is_empty [o] (== o nil) )

(deftest cons_examples
  (is (str_eq "a" (cons "a" nil) "head should be a")))
