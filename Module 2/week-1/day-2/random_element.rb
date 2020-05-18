def random_select(array, n)
  result = []
  n.times {
    random_i = rand(array.size)
    result << array[random_i] # "<<" is faster than push, but it only allows to insert one element
  }
  result
end
