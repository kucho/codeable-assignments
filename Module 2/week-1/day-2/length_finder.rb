def length_finder(input_array)
  input_array.map { |input| input.length }
end

puts "[#{length_finder(%w[Ruby Rails C42]).join("-")}]"