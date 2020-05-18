# frozen_string_literal: true

# A square, Rubocop, a simple square
class Square
  attr_accessor :a

  def initialize(a)
    @a = a
  end

  def area
    a**2
  end
end

square_one = Square.new(10)
puts square_one.area # Logs: 100
