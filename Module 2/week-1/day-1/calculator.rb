class Calculator
  def add(a, b)
    a + b
  end

  def subtract(a, b)
    a - b
  end

  def divide(a, b)
    a / b
  end

  def multiply(a, b)
    a * b
  end

  def exponentiate(a, b)
    a ** b
  end

  def modulo(a, b)
    a % b
  end
end

calculator = Calculator.new
puts "Sum result is #{calculator.add(5, 4)}" # Should output "Sum result is 9"
puts "Subtraction result is #{calculator.subtract(5, 4)}" # Should output "Subtraction result is 1"
puts "Division result is #{calculator.divide(12, 4)}" # Should output "Division result is 3"
puts "Multiplication result is #{calculator.multiply(5, 4)}" # Should output "Multiplication result is 20"
puts "Exponentiation result is #{calculator.exponentiate(2, 3)}" # Should output "Exponentiation result is 8"
puts "Modulo result is #{calculator.modulo(5, 2)}" # Should output "Modulo result is 1"