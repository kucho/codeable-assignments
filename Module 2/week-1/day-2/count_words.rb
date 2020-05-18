def count_words(sentence)
  words = sentence.downcase.split
  words.to_h { |a| [a, words.count(a)] }
end

puts count_words("cake cake caKe I like cake very much please gIve me cake I need the cake i need it")