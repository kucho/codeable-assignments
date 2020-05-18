def process_orders(people_orders)
  orders = people_orders.values.sort
  orders.to_h { |e| [e, orders.count(e)] }
end

people_orders = {
    "julio" => "pizza",
    "diego" => "saltado",
    "andres" => "hamburguer",
    "ximena" => "ceviche",
    "felipe" => "pizza",
    "jon" => "saltado",
    "snow" => "ceviche",
    "pepe" => "fried chicken",
    "queen of dragons" => "ice cream",
    "jose" => "hamburguer",
    "jafeth" => "fried chicken"
}

puts process_orders(people_orders)