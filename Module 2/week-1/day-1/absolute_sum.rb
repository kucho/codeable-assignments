print "First number: "
a = gets.chomp.to_i(10)

print "Second number: "
b = gets.chomp.to_i(10)

sum = a + b
sum < 0 ? sum *= -1 : nil
puts sum

