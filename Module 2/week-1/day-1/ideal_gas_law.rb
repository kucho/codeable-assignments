IDEAL_GAS = 8.314.freeze # The Ruby interpreter does not actually enforce the constancy of constants

def calculate_pressure(chemical_amount, temperature, volume)
  (chemical_amount * IDEAL_GAS *  temperature) / volume
end

puts calculate_pressure(5, 500, 2)