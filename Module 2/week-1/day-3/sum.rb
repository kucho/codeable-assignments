# frozen_string_literal: true

def sum(*nums)
  nums.reduce(0) { |sum, num| sum += num }
end

p sum(10, 2, 3, 4, 5, 1, 20)
