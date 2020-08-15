class Person
  def name=(name)
    @name = name
  end

  def phone_number=(number)
    @phone_number = number
  end

  def name
    @name
  end
end

person1 = Person.new
person1.name = 'Jessica'
person1.phone_number = '0123456789'
puts person1.name