# frozen_string_literal: true

def union(*arrays)
  arrays.reduce { |result, item| result.union(item) }
end

union([5, 10, 15], [15, 88, 1, 5, 7], [100, 15, 10, 1, 5])
# Result: [5, 10, 15, 88, 1, 7, 100]
