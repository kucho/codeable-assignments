# frozen_string_literal: true

# A rubber duck, Rubocop, a rubber duck!
class RubberDuck
  def initialize(color, size)
    @color = color
    @size = size
    @quacks = 0
  end

  def press!
    if @quacks.even?
      puts 'QUAAAAACKKKKKKKKKK'
    else
      puts 'Peace and love, quack'
    end
    @quacks += 1
  end
end

stoner_duck = RubberDuck.new(:yellow, :small)
stoner_duck.press!
stoner_duck.press!

# A candy box, Rubocop, a simple candy box!
class CandyBox
  def initialize(name, units)
    @name = name
    @units = units
    puts "#{name}: #{units} units"
  end

  def eat_one!
    if @units.positive?
      @units -= 1
      puts "* yummy! * -- I have #{@units} left *"
    else
      puts "You don't have enough candy, big boy!"
    end
  end

  def eat_chunk!
    if @units.positive?
      @units -= rand(1..@units)
      puts "* sugar rush! asifuhasf! * -- I have #{@units} left *"
    else
      puts "There's nothing left, big boy :("
    end
  end
end

tic_tac = CandyBox.new('Tic Tac naranja', 20)
tic_tac.eat_chunk!
tic_tac.eat_one!
tic_tac.eat_chunk!
