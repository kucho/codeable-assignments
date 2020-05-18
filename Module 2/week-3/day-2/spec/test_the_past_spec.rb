require "../test_the_past"

describe "non_duplicated_values" do
  it "Returns an array of non duplicated values" do
    a = [1, 2, 2, 3, 3, 4, 5]
    expect(non_duplicated_values(a)).to eql([1, 4, 5])
  end
end

describe "summation" do
  it "returns the sum of the values" do
    expect(summation(3) { |val| val * 2 }).to eql(12)
  end
end

describe Restaurant do
  describe "cost" do
    it "calculates the total" do
      menu = Restaurant.new({ rice: 3, noodles: 2 })
      expect(menu.cost({ rice: 1, noodles: 1 })).to eql(5)
    end
  end
end
