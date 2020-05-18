# frozen_string_literal: true

require 'json'

data = File.open('squad.json') { |f| JSON.parse f.read }

puts "Our squad is called #{data['squadName']}"
puts "We are from #{data['homeTown']}"
puts "Our team started back in #{data['formed']}"
puts 'Our members are:'
data['members'].map do |member|
  puts "- #{member['name']}"
  puts "- Age: #{member['age']}"
  puts "- Secret Identity: #{member['secretIdentity']}"
  puts "- Superpowers: #{member['powers'].join(',')}"
  puts
end
