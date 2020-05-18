def put_n(text, n)
  unless n.is_a?(Integer) && n.positive?
    raise ArgumentError
  end

  n.times { puts text }
end

def echo
  puts "What do you want to echo?"
  text = gets.chomp
  puts "How many times do you want to repeat it?"
  times = Integer(gets.chomp)

  put_n(text, times)
rescue StandardError
  puts "I don't understand how many times do you want to echo the string!"
  retry
end

echo

# Logs
=begin
What do you want to echo?
  Codeable rocks.
How many times do you want to repeat it?
  No lo se
I don't understand how many times do you want to echo the string!
What do you want to echo? # the program repeats.
=end
