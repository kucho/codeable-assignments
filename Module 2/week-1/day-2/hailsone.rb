def hailstone(x)
  sequence = [x]
  until x == 1
    x.even? ? x /= 2 : x = x * 3 + 1
    sequence.push(x)
  end

  puts "Sequence: #{sequence.join("-")}"
  puts "Steps: #{sequence.size - 1}"
end

n = -1

until n > 0
  print "n: "
  n = gets.chomp.to_i(10)
end

hailstone(n)