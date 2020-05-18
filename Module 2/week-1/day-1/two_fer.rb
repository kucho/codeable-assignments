print "who? "
name = gets.chomp

if name.empty?
  puts "One for you, one for me."
else
  puts "One for #{name}, one for me."
end
