def reduce(array, num=0)
  return_number = num

  array.length.times do |idx|
    return_number = yield(return_number, array[idx])
  end

  return_number
end

array = [1, 2, 3, 4, 5]

puts reduce(array) { |acc, num| acc + num }                    # => 15
puts reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
