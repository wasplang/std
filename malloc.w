(pub defn malloc [size]
  (let [current_heap (mem_heap_end)]
    (mem32 current_heap size)
    (mem_heap_end (+ current_heap 5 size))
    (+ current_heap 5)))
