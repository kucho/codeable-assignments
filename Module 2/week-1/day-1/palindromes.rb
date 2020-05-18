def palindrome? (sentence)
  sentence.downcase!
  without_spaces = sentence.delete(" ")
  without_spaces.eql?(without_spaces.reverse) ? true : false
end

puts palindrome?("Never odd or even")