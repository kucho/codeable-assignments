require "test/unit/assertions"
include Test::Unit::Assertions

def digital_root(n)
  sum = 0

  begin
    digit = n % 10
    sum += digit
    n = n / 10
  end while n > 0

  if sum > 10
    digital_root(sum)
  else
    sum
  end
end

assert_equal(digital_root(16), 7)
assert_equal(digital_root(456), 6)
