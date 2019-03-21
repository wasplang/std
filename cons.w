(defn cons [h t]
  (let [pos (malloc 8)]
    (mem32 pos h)
    (mem32 (+ pos 4) t)
    pos))

(defn head [c]
  (mem32 c))

(defn tail [c]
  (mem32 (+ c 4)))
