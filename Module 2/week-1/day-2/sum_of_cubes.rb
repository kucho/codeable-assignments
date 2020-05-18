def sum_of_cubes(a, b)
  (a..b).inject(0) { |sum, element| sum += element ** 3 }
end

puts sum_of_cubes(1, 3)