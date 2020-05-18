print "Amount: "
amount = gets.chomp.to_f

print "Interest rate: "
interest = gets.chomp.to_f

print "Periods: "
n = gets.chomp.to_i(10)

n.times { amount *= 1 + interest }

print "Final balance: $%.2f" % amount