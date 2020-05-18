def find_frequency(sentence, word)
  sentence.downcase!
  word.downcase!
  sentence.split.count(word)
end

puts find_frequency("Ruby is The best language in the World", "the")