class Pet
  attr_reader :name, :type
  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Owner
  attr_reader :name, :number_of_pets
  def initialize(name)
    @name = name
    @pets = []
    @number_of_pets = 0
  end

  def adopt_pet(pet)
    @number_of_pets += 1
    @pets << pet
  end

end

class Shelter
  def initialize
    @adoption_list = {}
  end

  def adopt(owner=nil, pet)
    if owner
      owner.adopt_pet(pet)
      if @adoption_list[owner.name]
        @adoption_list[owner.name] << pet
      else
        @adoption_list[owner.name] = [pet]
      end
    else
      if @adoption_list[nil]
        @adoption_list[nil] << pet
      else
        @adoption_list[nil] = [pet]
      end
    end

  end

  def print_adoptions
    @adoption_list.each do |owner, pets|
      if owner
        puts "#{owner} has adopted the following pets:"
      else
        puts 'The Animal Shelter has the following unadopted pets:'
      end

      pets.each do |pet|
        puts "a #{pet.type} named #{pet.name}"
      end
    end

    puts ''
  end
end



butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
tester      = Pet.new('fish', 'Tester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.adopt(nil,tester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

