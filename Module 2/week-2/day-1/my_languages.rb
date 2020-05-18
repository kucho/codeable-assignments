def my_languages(results)
  results
    .values
    .sort
    .reverse
    .select { |val| val >= 60 }
    .map { |val| results.key(val) }
end
