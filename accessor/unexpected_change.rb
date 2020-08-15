class Person
  def name=(whole_name)
    @first_name, @last_name = whole_name.split(' ')
  end

  def name
    "#{@first_name} #{@last_name}"
  end

end

person1 = Person.new
person1.name = 'John Doe'
puts person1.name