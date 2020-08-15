class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# After calling 'puts fluffy', the object pointed to by the name variable gets
# mutated and each further call of that variable will be mutated.
puts "~~~~~Extra~~~~~"
name = 42
fluffy = Pet.new(name)
name += 1
puts fluffy.name
puts fluffy
puts fluffy.name
puts name

# This code produces the result it does because
# name +=1 reassigns the name variable to 42+1.
# The instance variable @name was assigned to
# the object name.upcase so updating name won't
# change that value.