(def nil 0)

(defn cons [h t]
  (let [pos (malloc 8)]
    (mem32 pos h)
    (mem32 (+ pos 4) t)
    pos))

(defn head [c]
  (mem32 c))

(defn tail [c]
  (mem32 (+ c 4)))

(defn is_empty [o] (== o nil) )

(deftest cons_examples
  (is (str_eq "a" (cons "a" nil) "head should be a")))
