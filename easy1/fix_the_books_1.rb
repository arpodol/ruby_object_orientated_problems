class Book
  attr_reader :author, :title
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

=begin
attr_reader creates getter for class attributes, attr_writer creates setters for
class attributes, and attr_accessor creates setters and getters for class attributes.
In this case, only attr_reader and attr_accessor would have worked since we needed getters.

If we used the following piece of code instead:
def title
  @title
end

def author
  @author
end

This would work also since it explicitly defines the methods that attr_reader creates.
The advantage of this is that if one needs to make an update later to how one retrieves
an attribute, they can do so readily.


=end
