=begin
The Greek mathematician Nicomachus devised a classification scheme for natural
numbers (1, 2, 3, ...), identifying each as belonging uniquely to the categories
of abundant, perfect, or deficient based on a comparison between the number and
the sum of its positive divisors (the numbers that can be evenly divided into
the target number with no remainder, excluding the number itself). For instance,
the positive divisors of 15 are 1, 3, and 5. This sum is known as the Aliquot
sum.

Perfect numbers have an Aliquot sum that is equal to the original number.
Abundant numbers have an Aliquot sum that is greater than the original number.
Deficient numbers have an Aliquot sum that is less than the original number.

Write a program that can tell whether a number is perfect, abundant, or
deficient.

PROBLEM
- take number, determine which numbers are divisible with no remainder
- sum those numbers
  - if the sum is equal to the original number, return "perfect",
  - if the sum is less than the original number, return "deficient",
  - if the sum is greater than the original number, return "abundant"
If number is 0 or less than 0, raise Standard error

EXAMPLES
- 6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
- 28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and
1 + 2 + 4 + 7 + 14 = 28.
- 15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9
which is less than 15.
- 24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and
1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
- Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

DATA
Input is integer
output is string

ALGORITHM
Create class PerfectNumber
crate class method classify that takes an integer, num, as an an argument
raise Standard error if number is less than 1

create helper method to generate divisors
- initialize empty array to divisors
- iterate from 1 to num minus 1 with n as parameter
  - if num % n is 0, add n to divisors
  - return divisors
- back in classify method, assign sum_of_divisors to the return of helper method
  with num as argument, summed

- create case statement for the sum of divisors
  if same as num, return 'perfect'
  if less than num, return 'deficient'
  if more than num, return 'abundant'
=end

class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 1

    sum_of_divisors = get_divisors(num).sum

    if sum_of_divisors == num
      'perfect'
    elsif sum_of_divisors < num
      'deficient'
    else
      'abundant'
    end
  end

  def self.get_divisors(num)
    divisors = []
    1.upto(num - 1) { |n| divisors << n if num % n == 0 }
    divisors
  end
end
