fn mem_copy(source,destination,length){
  i = 0
  loop {
    mem((destination + i),mem((source + i)))
    if (i < length) {
      i = (i + 1)
      recur
    } else {
      0
    }
  }
}
