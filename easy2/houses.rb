class House
  attr_reader :price
  include Comparable

  def initialize(price)
    @price = price
  end

  def <=>(other)
    price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

# Further exploration
# The technique used here is only good if you are comparing prices.
# In most cases, each individual has their own criteria and even then,
# often times people like to see a home in person before purchasing it.
# Classes where including Comparable is a good idea would be where
# the you could order objects of that class logically.