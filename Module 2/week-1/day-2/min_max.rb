def min(numbers)
  min = numbers[0]

  numbers.each { |n|
    min = n if n < min
  }

  puts min
end

def max(numbers)
  max = numbers[0]

  numbers.each { |n|
    max = n if n > max
  }

  puts max
end

numbers = [2, 56, 5, 3, 4, 6, 1, -3456, 123891, 454, 1, 23, 5, 7]
min(numbers) # Result is -3456
max(numbers) # Result is 123891