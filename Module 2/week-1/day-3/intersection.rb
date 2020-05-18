# frozen_string_literal: true

def intersection(*arrays)
  arrays.reduce { |result, item| result & item }
end

intersection([5, 10, 15, 20], [15, 88, 1, 5, 7], [1, 10, 15, 5, 20])
# Result: [5, 15]