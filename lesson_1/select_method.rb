def select(array)
  return_array = []
  counter = 0

  while counter < array.size
    return_array << array[counter] if yield(array[counter])                  # yield to the block, passing in the current element to the block
    counter += 1
  end

  return_array                                             # returns the `array` parameter, similar in spirit to how `Array#each` returns the caller
end

array = [1, 2, 3, 4, 5]

puts select(array) { |num| num.odd? } == [1, 3, 5]
puts select(array) { |num| puts num } == [] #, because "puts num" returns nil and evaluates to false
puts select(array) { |num| num + 1 } == [1, 2, 3, 4, 5] #, because "num + 1" evaluates to true
