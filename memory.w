(defn memcopy_helper [source destination length i]
  (if (== i length)
    nil
    (do (mem (+ destination i) (mem (+ source i)))
        (memcopy_helper source destination length (+ 1 i)))))
(defn memcopy [a b length]
  (memcopy_helper a b length 0))
