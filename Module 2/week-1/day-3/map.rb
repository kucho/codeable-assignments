# frozen_string_literal: true

def map(arr)
  arr.each_with_index { |num, index| arr[index] = yield(num) }
end

test_array = [2, 3, 4, 5]
map(test_array) { |element| element * 3 }
# Result: [6, 9, 12, 15]
