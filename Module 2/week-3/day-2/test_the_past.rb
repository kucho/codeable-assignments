def non_duplicated_values(values)
  values.tally.select { |_key, value| value == 1 }.keys
end

def summation(n)
  (1..n).reduce(0) { |sum, num| sum += yield(num) }
end

class Restaurant
  def initialize(menu)
    @menu = menu
  end

  def cost(*orders)
    orders.reduce(0) do |total, order|
      total + order.keys.reduce(0) { |cost, dish| cost + @menu[dish] * order[dish] }
    end
  end
end