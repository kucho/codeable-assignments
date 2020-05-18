# frozen_string_literal: true
require 'test/unit/assertions'

include Test::Unit::Assertions

class CaesarCipher
  @@chars = ('A'..'Z').to_a
  def initialize(shift)
    @shift = shift
  end

  def encode(string)
    string.upcase.chars.map do |c|
      next c unless @@chars.include? c

      @@chars[(@@chars.index(c) + @shift) % @@chars.size]
    end.join('')
  end

  def decode(string)
    string.chars.map do |c|
      next c unless @@chars.include? c

      @@chars[(@@chars.index(c) - @shift)]
    end.join('')
  end
end

c = CaesarCipher.new(5)

assert_equal(c.encode('Codewars'), 'HTIJBFWX')
assert_equal(c.decode('HTIJBFWX'), 'CODEWARS')
assert_equal(c.encode('WAFFLES'), 'BFKKQJX')
assert_equal(c.decode('BFKKQJX'), 'WAFFLES')
assert_equal(c.encode("IT'S A SHIFT CIPHER!!"), "NY'X F XMNKY HNUMJW!!")
assert_equal(c.decode("NY'X F XMNKY HNUMJW!!"), "IT'S A SHIFT CIPHER!!")