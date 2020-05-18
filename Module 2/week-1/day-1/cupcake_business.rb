class Part
  def initialize(name, optional = false)
    @name = name
    @optional = optional
    @variants = []
  end

  attr_accessor :name, :variants, :optional

  def add_variants(variants)
    variants.each { |v| @variants.push(v) }
  end
end

class Variant
  def initialize(name, price)
    @name = name
    @price = price
  end

  attr_accessor :name, :price
end

class Pack
  def initialize(size)
    @size = size
    @products = []
  end

  attr_accessor :size, :products

  def add_products(product, n)
    if @products.length + n <= size && n > 0
      (1..n).each { @products.push(product) }
    else
      puts "Product overflow"
    end
  end

  def is_full
    @products.length == size ? true : false
  end

  def total
    total = 0
    @products.each do |p|
      p.each do |v|
        total += v.price
      end
    end
    total
  end
end

def discount_for(size)
  case size
  when 6
    0.04
  when 12
    0.1
  else
    0
  end
end

# We create the menu
bread = Part.new("Bread")
types_of_bread = [Variant.new("Vanilla", 0.5), \
                  Variant.new("Chocolate", 0.75), \
                  Variant.new("Red Velvet", 0.85)]
bread.add_variants(types_of_bread)

frosting = Part.new("Frosting")
types_of_frosting = [Variant.new("Vanilla", 0.6), \
                     Variant.new("Oreo", 1.10), \
                     Variant.new("Mint chocolate", 1.45)]
frosting.add_variants(types_of_frosting)

filling = Part.new("Filling", true)
types_of_filling = [Variant.new("Nutella", 1.0), \
                    Variant.new("Strawberry", 0.55), \
                    Variant.new("Peanut butter", 0.45)]
filling.add_variants(types_of_filling)

menu = [bread, frosting, filling]


print "How many cupcakes do you want? (1 - 6 - 12): "
size = gets.chomp.to_i(10)

unless size == 1 || size == 6 || size == 12
  puts "Invalid presentation size"
  exit(1)
end

pack = Pack.new(size)

until pack.is_full
  product = []

  menu.each do |m|
    print "\nWhat type of #{m.name.downcase} do you prefer?\n"
    m.variants.each_with_index { |v, i| puts "#{i + 1}. #{v.name} - $#{v.price}" }

    skip_opt = 0
    if m.optional
      puts "#{m.variants.length + 1}. Skip this part"
      skip_opt = 1
    end

    v_index = -1
    while v_index > m.variants.length - 1 + skip_opt|| v_index < 0
      print "Answer: "
      v_index = gets.chomp.to_i(10) - 1
    end

    if v_index == m.variants.length
      next
    end

    product.push(m.variants[v_index])
  end

  print "\nHow many items of the selected product do you want to add?: "
  quantity = gets.chomp.to_i(10)
  pack.add_products(product, quantity)
end

discounted_total = (pack.total * (1 - discount_for(pack.size))).round(2)

print "\nYou will have to pay $#{discounted_total}"