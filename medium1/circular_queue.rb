=begin
class CircularQueue
  def initialize(size)
    @circular_array = Array.new(size)
    @index_size = size - 1
    @newest_list_head = 0
    @oldest_list_head = 0
  end

  def enqueue(object)
    unless @circular_array[@newest_list_head].nil?
      if @oldest_list_head == @index_size
        @oldest_list_head = 0
      else
        @oldest_list_head += 1
      end
    end
    @circular_array[@newest_list_head] = object
    if @newest_list_head == @index_size
      @newest_list_head = 0
    else
      @newest_list_head += 1
    end
  end

  def dequeue
    return nil if @circular_array.all? {|index| index.nil?}
    return_val, @circular_array[@oldest_list_head] = @circular_array[@oldest_list_head], nil
    if @oldest_list_head == @index_size
      @oldest_list_head = 0
    else
      @oldest_list_head += 1
    end
    return_val
  end
end

=end

class CircularQueue
  def initialize(size)
    @circular_array = []
    @size = size
  end

  def dequeue
    @circular_array.shift
  end

  def enqueue(entry)
    if @circular_array.size == @size
      @circular_array.delete_at(0)
    end
    @circular_array.push(entry)
  end

end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil