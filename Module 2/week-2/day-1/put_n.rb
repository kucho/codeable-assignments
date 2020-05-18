def put_n(text, n)
  unless n.is_a?(Integer) && n.positive?
    raise ArgumentError.new("The second argument must be a positive integer")
  end

  n.times { puts text }
end

put_n("This will be printed 5 times!", 5)
# Logs
# This will be printed 5 times!
# This will be printed 5 times!
# This will be printed 5 times!
# This will be printed 5 times!
# This will be printed 5 times!
