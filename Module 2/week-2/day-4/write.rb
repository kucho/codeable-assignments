# frozen_string_literal: true

File.open('name', 'w') do |file|
  p 'What is your name?'
  name = gets.chomp
  file.write(name)
end
