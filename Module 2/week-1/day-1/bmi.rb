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

p = Person.new("Julio", 1.85, 80)
puts p.bmi