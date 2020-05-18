# frozen_string_literal: true

def age?(year, month, day)
  Time.at(Time.now - Time.new(year, month, day)).year - 1970
end

age?(1994, 2, 24) # Should return 26
