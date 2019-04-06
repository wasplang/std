fn cons(h,t){
  pos = malloc((2 * size_num))
  mem_num(pos,h)
  mem_num((pos + size_num),t)
  pos
}

fn head(c){
  mem_num(c)
}

fn tail(c){
  mem_num((c + size_num))
}

fn is_empty(o){
  (o == nil)
}
