NUMBERS_FOR_HUNDREDS = ['C', 'D', 'M']
NUMBERS_FOR_TENS = ['X', 'L', 'C']
NUMBERS_FOR_ONES = ['I', 'V', 'X']

def convert_numbers(numbers, array)
  roman_numbers = ''

  case numbers
  when (1..3)
    numbers.times { roman_numbers << array[0] }
  when 4
    roman_numbers.concat(array[0..1].join)
  when (5..8)
    roman_numbers << array[1]
    (numbers - 5).times { roman_numbers << array[0] }
  else
    roman_numbers.concat(array[0], array[2])
  end

  roman_numbers
end

p convert_numbers(1, NUMBERS_FOR_ONES)
p convert_numbers(2, NUMBERS_FOR_ONES)
p convert_numbers(3, NUMBERS_FOR_ONES)
p convert_numbers(4, NUMBERS_FOR_ONES)
p convert_numbers(5, NUMBERS_FOR_ONES)
p convert_numbers(6, NUMBERS_FOR_ONES)
p convert_numbers(7, NUMBERS_FOR_ONES)
p convert_numbers(8, NUMBERS_FOR_ONES)
p convert_numbers(9, NUMBERS_FOR_ONES)
