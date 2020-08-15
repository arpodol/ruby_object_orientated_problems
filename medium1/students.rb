class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super
  end
end

# Further exploration
# A case where super() related to Student would be used would be in the case
# where the initialize has default values for the parameters. In that case, one could
# set the name and year to a default value for a student placeholder object.