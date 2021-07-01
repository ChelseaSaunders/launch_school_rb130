=begin
Write some code that converts modern decimal numbers into their Roman number
equivalents.

The Romans were a clever bunch. They conquered most of Europe and ruled it for
hundreds of years. They invented concrete and straight roads and even bikinis.
One thing they never discovered though was the number zero. This made writing
and dating extensive histories of their exploits slightly more challenging, but
the system of numbers they came up with is still in use today. For example the
BBC uses Roman numerals to date their programmes.

The Romans wrote numbers using letters - I, V, X, L, C, D, M. Notice that these
letters have lots of straight lines and are hence easy to hack into stone
tablets.

There is no need to be able to convert numbers larger than about 3000.
(The Romans themselves didn't tend to go any higher)

PROBLEM:
Convert integer into string characters representing the roman numerals for that
number

Rules:
- input integers will not be larger than 3000
- 1, 2, and 3 are written with equivilent number of 'I''s (I, II, III)
- 5 is V
- 10 is X
- 50 is L
- 100 is C
- 500 is D
- 1000 is M
- for numbers in-between, characters to the right of the larger character are to
  be added to it (VI is 6 (5 + 1)), and characters to the left of the smaller
  are to be subtracted from it (IV is 4 (5 - 1))
-
EXAMPLES
1  => I
10  => X
7  => VII

Wikipedia says: Modern Roman numerals ... are written by expressing each digit
separately starting with the left most digit and skipping any digit with a value
of zero.

To see this in practice, consider the example of 1990. In Roman numerals, 1990
is MCMXC:
1000=M
900=CM
90=XC

2008 is written as MMVIII:
2000=MM
8=VIII

DATA
input is integer
output is string
array? for working with with string characters correspinding to the input
  integer?

ALGORITHM
- Create class RomanNumeral
 - create initialzize method that takes integer as argument
    - assig integer to instance variable number

- create generate_nonzero_digits method
- assign thousands to number / 1000
- assign hundreds to number % 1000 / 100
- assign tens to hundreds % 100 / 10
- asign last_digit to tens % 10

- return array of [thousands, hundreds, tens, last_digit], but with nil and 0
  removed

- create constants with arrays for each possible value for thousands, hundreds,
  tens, and ones

- create convert_numbers instance method that takes a digit and one of the value arrays
  as an argument, and converts the digit to the appropriate combination of
  characters from the value array, based on the value of the digits

- create to_roman instance method
  iterate through digits using digit as parameter
  create a case statement for digit
  skip if digit is 0
  case
=end

class RomanNumeral
  attr_reader :number, :thousands, :hundreds, :tens, :ones

  def initialize(number)
    @number = number
  end

  def generate_non_zero_digits
    thousands = number / 1000
    hundreds = number % 1000 / 100
    tens = number % 100 / 10
    ones = number % 10

    [thousands, hundreds, tens, ones].map { |num| num.nil? ? 0 : num }
  end

  NUMBERS_FOR_THOUSANDS = ['M']           # 3000
  NUMBERS_FOR_HUNDREDS = ['C', 'D', 'M']  # 100, 500, 1000
  NUMBERS_FOR_TENS = ['X', 'L', 'C']      # 10, 50, 100
  NUMBERS_FOR_ONES = ['I', 'V', 'X']      # 1, 5, 10

  def convert_numbers(numbers, array)
    roman_numbers = ''

    case numbers
    when 0
      ''
    when (1..3)
      numbers.times { roman_numbers << array[0] }
    when 4
      roman_numbers.concat(array[0..1].join)
    when (5..8)
      roman_numbers << array[1]
      (numbers - 5).times { roman_numbers << array[0] }
    when 9
      roman_numbers.concat(array[0], array[2])
    end

    roman_numbers
  end

  def to_roman
    digits = generate_non_zero_digits
    roman_numerals = ''

    digits.each_with_index do |digit, index|
      case index
      when 0
        roman_numerals << convert_numbers(digit, NUMBERS_FOR_THOUSANDS)
      when 1
        roman_numerals << convert_numbers(digit, NUMBERS_FOR_HUNDREDS)
      when 2
        roman_numerals << convert_numbers(digit, NUMBERS_FOR_TENS)
      when 3
        roman_numerals << convert_numbers(digit, NUMBERS_FOR_ONES)
      end
    end

    roman_numerals
  end
end
