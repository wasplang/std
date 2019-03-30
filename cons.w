(def nil 0)

(defn cons [h t]
  (let [pos (malloc 16)]
    (mem_num pos h)
    (mem_num (+ pos 8) t)
    pos))

(defn head [c]
  (mem_num c))

(defn tail [c]
  (mem_num (+ c 8)))

(defn is_empty [o] (== o nil) )

(deftest cons_examples
  (is (str_eq "a" (cons "a" nil) "head should be a")))
