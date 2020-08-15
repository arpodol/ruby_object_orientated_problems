class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
  def initialize(name, age, color)
    super(name, age)
    @color = color
  end

  def to_s
    "My cat #{@name} is #{@age} years old and has #{@color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

# Further exploration
# If we added color as a parameter to the Pet class, we wouldn't need an
# initialize method in Cat because by default, if no initialize is supplied
# in the child class, the parent class' implementation would be called.
# I would say this would be a bad idea if not every pet would have a color.
# One could bypass this issue by having that parameter default to possibly nil
# if no value is passed in.
