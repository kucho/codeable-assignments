def parts_sums(ls)
  result = []

  sum = ls.sum

  ls.each do |element|
    result << sum
    sum -= element
  end

  result << 0
end

p parts_sums [0, 1, 3, 6, 10]
