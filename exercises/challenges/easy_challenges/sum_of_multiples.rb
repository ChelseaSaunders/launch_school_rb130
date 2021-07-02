=begin
Write a program that, given a natural number and a set of one or more other
numbers, can find the sum of all the multiples of the numbers in the set that
are less than the first number. If the set of numbers is not given, use a
default set of 3 and 5.

For instance, if we list all the natural numbers up to, but not including, 20
that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The
sum of these multiples is 78.

PROBLEM
Take a set of at least 2 input integers (default to 3 and 5)
Take input integer in .to method
Generate all numbers up to the input number from .to method that are multiples
of the initial input integers (default 3 and 5).
Determine the sum of those multiples (unique values only), and return that sum
- must have both class and instance method
- do not include final number/number from input

EXAMPLES
see test suite

DATA
- input is integers, and either empty array or array of integers (because of
  possibility of more than 2 step values, using * generates array)
- output is integer

ALGORITHM
- Create class SumOfMultiples
- create initialization method that takes 3 arguments, step1 which defaults to
  3, step2, which defaults to 5 and a *arr that takes additional integers.
    - assign instance variable steps to arr with step1 and step2 added to it
  - create reader for step
- create method to that takes an integer, number, as an argument
  - create empty array, assign to multiples
  - iterate through steps, skipping any elements that are greater than number
    argument; use num as parameter for iteration
    - for each num, start with num and add num, then push that value to
      multiples, until num is greater than number - 1

  - eliminate duplicate values from multiples, then return the sum of each
    element in multiples

- create class method, to, that takes one argument, num
  - create new SumOfMultiples object, call .to on it with num as argument
=end

class SumOfMultiples
  attr_reader :steps

  def initialize(*arr)
    @steps = arr.empty? ? [3, 5] : arr
  end

  def to(number)
    multiples = []

    steps.each do |num|
      next if num >= number
      num.step(by: num, to: number - 1) { |n| multiples << n }
    end

    multiples.uniq.sum
  end

  def self.to(num)
    SumOfMultiples.new.to(num)
  end
end
