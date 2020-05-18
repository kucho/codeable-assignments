# frozen_string_literal: true

def non_duplicated_values(values)
  values.tally.select { |_key, value| value == 1 }.keys
end

a = [1, 2, 2, 3, 3, 4, 5]
p non_duplicated_values(a)
