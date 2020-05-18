class Person
  def initialize(name, height, weight)
    @name = name
    @height = height
    @weight = weight
  end

  attr_accessor :height, :weight
  attr_reader :name

  def bmi
    (weight / height ** 2).round(2)
  end
end

print "What's your name?: "
name = gets.chomp

print "Show me the weight (kg): "
weight = gets.chomp.to_f

unless weight > 0
  puts "Invalid weight"
  exit(1)
end

print "Show me the height (m): "
height = gets.chomp.to_f

unless height > 0
  puts "Invalid height"
  exit(1)
end

p = Person.new(name, height, weight)
puts "#{p.name.capitalize}'s BMI is #{p.bmi}"