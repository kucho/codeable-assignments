# frozen_string_literal: true

# Process the menu orders
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

menu = Restaurant.new({ rice: 3, noodles: 2 })
p menu.cost({ rice: 1, noodles: 1 })
