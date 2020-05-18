# frozen_string_literal: true

def prioritize(array)
  groups = array.group_by { |item| yield(item) }
  groups[true] + groups[false]
end

test_array = [2, 3, 4, 5]
prioritize(test_array) { |val| val > 3 }
# Result: [4, 5, 2, 3]
