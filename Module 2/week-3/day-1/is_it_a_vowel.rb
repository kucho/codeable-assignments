# frozen_string_literal: true

# Implement the function which should return true if given object is a vowel
# (meaning a, e, i, o, u), and false otherwise.
class String
  def vowel?
    /\b[a,e,i,o,u]{1,1}\b/i.match?(self)
  end
end

p 'ao'.vowel? # false
p 'a'.vowel? # true