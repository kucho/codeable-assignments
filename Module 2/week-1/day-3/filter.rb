# frozen_string_literal: true

def filter(arr)
  result = []
  arr.each { |num| result << num if yield(num) }
  result
end

test_array = [2, 3, 4, 5]
filter(test_array) { |element| element > 3 }
# Result: [4, 5] -> numbers 2 and 3 were removed
