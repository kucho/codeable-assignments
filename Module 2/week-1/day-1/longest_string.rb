def longest_string(string_a, string_b)
  if string_a.length > string_b.length
    puts "Yes, I'm the longest"
  else
    puts "No, you are not the longest; liar."
  end
end

longest_string("I am the longest.", "No, you are not the longest; liar.")
