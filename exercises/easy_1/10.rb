# Write a method that takes an array as an argument, and a block that returns
# true or false depending on the value of the array element passed to it. The
# method should return a count of the number of times the block returns true.

# You may not use Array#count or Enumerable#count in your solution.

def count(arr)
  true_elements = 0

  arr.each { |value| true_elements += 1 if yield(value) }

  true_elements
end

count([1,2,3,4,5]) { |value| value.odd? } == 3
count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
count([1,2,3,4,5]) { |value| true } == 5
count([1,2,3,4,5]) { |value| false } == 0
count([]) { |value| value.even? } == 0
count(%w(Four score and seven)) { |value| value.size == 5 } == 2

# Further Exploration
# Write a version of the count method that meets the conditions of this exercise,
# but also does not use each, loop, while, or until.


def count(arr)
  true_elements = 0

  arr.length.times { |idx| true_elements += 1 if yield(arr[idx]) }

  true_elements
end

count([1,2,3,4,5]) { |value| value.odd? } == 3
count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
count([1,2,3,4,5]) { |value| true } == 5
count([1,2,3,4,5]) { |value| false } == 0
count([]) { |value| value.even? } == 0
count(%w(Four score and seven)) { |value| value.size == 5 } == 2
