USD_TO_PEN = 3
USD_TO_ARS = 40

def how_much_is_it(input)
  products = process_string_to_hash(input)

  # Convert it to usd
  products.each do |p|
    price = p["Price"]
    p["Price"] = convert_to_usd(price)
  end

  max_value = 0
  max_product = nil

  total_value = products.select { |product| product["Stock"] == "true" }.inject(0) do |sum, product|
    price = product["Price"][4..-1].to_f
    qty = product["Amount"].to_i

    total = price * qty

    if total > max_value
      max_value = total
      max_product = product
    end

    sum + total
  end

  puts "Value of goods in stock: USD #{total_value.round(2)}"
  puts "The most valuable product in stock is: #{max_product["Name"]}"
end

def convert_to_usd(price)
  currency = price.slice!(0..2)
  _converted = case currency
    when "PEN"
      "USD #{(price.to_f / USD_TO_PEN).round(2)}"
    when "ARS"
      "USD #{(price.to_f / USD_TO_ARS).round(2)}"
    else
      "USD#{price}"
    end
end

def process_string_to_hash(input)
  data = input.split("\n").map! { |row| row.split(",").map! { |col| col.strip } }

  products = []

  data.each_index do |row_index|
    next if row_index == 0
    hash = {}
    data[row_index].each_with_index { |col, col_index|
      hash[data[0][col_index]] = col
    }
    products << hash
  end

  products
end

input = "Category, (Symbol) Price, Stock, Amount, Name
Sporting Goods, USD 49.99, true, 10, Football
Sporting Goods, PEN 9.99, true, 3, Baseball
Sporting Goods, ARS 29.99, false, 0, Basketball
Electronics, PEN 99.99, true, 5, iPod Touch
Electronics, USD 399.99, false, 0, iPhone 5
Electronics, PEN 199.99, true, 2, Nexus 7"

puts how_much_is_it(input)
