# frozen_string_literal: true

def reduce(arr, initial)
  arr.each do |el|
    initial = yield(initial, el)
  end
  initial
end

test_array = [2, 3, 4, 5]
reduce(test_array, 0) { |total_sum, current_value| total_sum + current_value }
# Result: 2 + 3 + 4 + 5 = 14
