(pub defn malloc [size]
  (let [current_heap (mem_heap_end)]
    (mem_num current_heap size)
    (mem_heap_end (+ current_heap 9 size))
    (+ current_heap 9)))
