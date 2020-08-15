class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3)
  end

  protected

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander

# The issue with the code is that expand is being called on the string
# and the string class doesn't have access to expand. This could be fixed
# by removing the self.