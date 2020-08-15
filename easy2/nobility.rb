module Walkable
  def walk
    puts "#{self} #{gait} forward"
  end
end

class Animal
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end


class Person < Animal

  private

  def gait
    "strolls"
  end
end

class Cat < Animal

  private

  def gait
    "saunters"
  end
end

class Noble < Person
  include Walkable
  attr_reader :title, :name
  def initialize(name, title)
    @name = name
    @title = title
  end

  private

  def gait
    "struts"
  end

  def to_s
    title + ' ' + name
  end
end

class Cheetah < Cat
  private

  def gait
    "runs"
  end
end


mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"

byron = Noble.new("Byron", "Lord")
byron.walk
# => "Lord Byron struts forward"

p byron.name
#=> "Byron"
p byron.title
#=> "Lord"

# Changes have ben made for future exploration by consolidating alot into the
# the animal parent class.
# The to_s method might not be best because if another case arises where puts
# is used for these objects, the normal use case might be to display the name
# and type of object. By using the to_s method for this instance, we might be
# jumping the gun and deciding for all future cases how they are to use to_s.