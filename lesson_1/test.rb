class Arr
  attr_accessor :arr

  def initialize
    @arr = []
  end

  def <<(element)
    arr << element
  end

  def pop
    arr.pop
  end

  def item_at(idx)
    arr.fetch(idx)

  end
end
array = Arr.new

array << 1
array << 2

p array

puts array.item_at(0)
