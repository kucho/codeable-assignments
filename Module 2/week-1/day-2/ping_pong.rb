def ping_pong(n)
  value = 0
  plus = 1

  (1..n).each { |i|
    value += plus
    plus *= -1 if i % 7 == 0 || contains_digit(i, 7)
  }

  puts value
end

def contains_digit(number, digit)
  until number == 0
    curr_digit = number % 10

    return true if curr_digit == digit

    number /= 10
  end

  false
end

ping_pong(100)