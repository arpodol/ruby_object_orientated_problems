class FixedArray
  def initialize(size)
    @fix_array = Array.new(size)
  end

  def [](index)
    if -@fix_array.length <= index && index < @fix_array.length
      @fix_array[index]
    else
      raise IndexError
    end
  end

  def to_a
    @fix_array
  end

  def []=(index, value)
    if -@fix_array.length <= index && index < @fix_array.length
      @fix_array[index] = value
    else
      raise IndexError
    end

  end

  def to_s
    @fix_array.to_s
  end
end



fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'
puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end