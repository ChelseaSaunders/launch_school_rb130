=begin
Write a program that will take a string of digits and return all the possible
consecutive number series of a specified length in that string.

For example, the string "01234" has the following 3-digit series:

012
123
234
Likewise, here are the 4-digit series:

0123
1234
Finally, if you ask for a 6-digit series from a 5-digit string, you should throw
an error.

PROBLEM
- take a string of digits and an integer
- return all the combinations of diigits from the original string that are in
  consecutive order, and are the length of the integer input
  * consecutive order is NOT the actual numeric order, just the order they
    appear in the string
- if the integer is longer than the length of the digit string, raise an
  Argument error

EXAMPLES

DATA
input: string of digits, integer
output: array of subarrays of integers

ALGORITHM
- create class Series
  - initialize with argument digits
  - assign digits to instance variable digits, and create getter for digits
- create instance method slices that takes one integer, num, as argument
  - raise ArgumentError if num is greater than the length of digits
  - create empty array slice_arr
  - assign digit_ints to digits, split into an array of characters and converted
    to integers
  - iterate through digit_ints, the length of the digits string, minus (num-1)
    times, using idx as parameter
    - add digit_ints[idx..idx + num] to slice_arr

  -return slice array

=end

class Series
  attr_reader :digits

  def initialize(digits)
    @digits = digits
  end

  def slices(num)
    raise ArgumentError if num > digits.length
    slice_arr = []
    digit_ints = digits.split('').map(&:to_i)

    (digit_ints.length - (num - 1)).times do |idx|
      slice_arr << digit_ints[idx..idx + (num - 1)]
    end

    slice_arr
  end
end
