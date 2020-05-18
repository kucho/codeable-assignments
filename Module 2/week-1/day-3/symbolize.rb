# frozen_string_literal: true

shopping_list = {
  eggs: { unit: 'und', value: 6 },
  chicken: { unit: 'grams', value: 1000 },
  tomatoes: { unit: 'und', value: 10 },
  pisco: { unit: 'liter', value: 1 },
  'ginger ale': { unit: 'liter', value: 1 },
  lemons: { unit: 'grams', value: 1500 },
  bread: { unit: 'grams', value: 500 }
}

shopping_list.each do |item, amount|
  puts "Grabbing #{amount[:value]} #{amount[:unit]} of #{item} from the shelf"
end
puts 'Paying all the items to the cashier!'
