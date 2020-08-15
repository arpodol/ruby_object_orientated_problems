class Book
  attr_accessor :title, :author
  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.)
puts %(book = #{book}.)

# Further exploration
# I believe that one should strive to create and initialize objects at the
# same time to avoid an instance where one might call an instance method that
# relies on an uninitialized variable.