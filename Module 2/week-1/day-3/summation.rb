# frozen_string_literal: true

def summation(n)
  (1..n).reduce(0) { |sum, num| sum += yield(num) }
end

p summation(3) { |val| val * 2 } # 1 * 2 + 2 * 2 + 3 * 2 = 12
