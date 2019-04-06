pub fn malloc(size){
  current_heap = mem_heap_end()
  mem_num(current_heap,size)
  header_size = (size + (2 * size_num))
  mem_heap_end((current_heap + header_size))
  (current_heap + header_size)
}
