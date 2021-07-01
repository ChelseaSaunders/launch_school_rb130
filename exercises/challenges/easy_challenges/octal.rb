=begin
Implement octal to decimal conversion. Given an octal input string, your program
should produce a decimal output. Treat invalid input as octal 0.

Note: Implement the conversion yourself. Don't use any built-in or library
methods that perform the necessary conversions for you. In this exercise, the
code necessary to perform the conversion is what we're looking for,

About Octal (Base-8)

Decimal is a base-10 system. A number 233 in base 10 notation can be understood
as a linear combination of powers of 10:

The rightmost digit gets multiplied by 100 = 1
The next digit gets multiplied by 101 = 10
The digit after that gets multiplied by 102 = 100
The digit after that gets multiplied by 103 = 1000
...
The n*th* digit gets multiplied by 10n-1.
All of these values are then summed.

Thus:
233 # decimal
= 2*10^2 + 3*10^1 + 3*10^0
= 2*100  + 3*10   + 3*1
Octal numbers are similar, but they use a base-8 system. A number 233 in base 8
can be understood as a linear combination of powers of 18:

The rightmost digit gets multiplied by 80 = 1
The next digit gets multiplied by 81 = 8
The digit after that gets multiplied by 82 = 64
The digit after that gets multiplied by 83 = 512
...
The n*th* digit gets multiplied by 8n-1.
All of these values are then summed.

Thus:
233 # octal
= 2*8^2 + 3*8^1 + 3*8^0
= 2*64  + 3*8   + 3*1
= 128   + 24    + 3
= 155

PROBLEM
Take an octal number, where each digit represents the number times 8 to the
  power of the digit (0's are power of 0, tens are power of 1, 100's are power
  of 2, etc)
convert it to a standard base-10 number

EXAMPLES

DATA
input: string
output: integer
might use strings/arrays to manipulate data

ALGORITHM
- create class Octal that takes an string as an argument upon initialization,
  converts it to integer, and assigns it to instance variable num (with a
  corresponding reader)

  HELPER METHOD, generate_chars
  - convert num to string and split to array of inividual characters(digits) and
    reverse array (so that ones will be at index 0, tens will be at index 1, etc
    which matches the power of 8 to assign to that position); assign to digits

- create instance method to_decimal
  - assign digits to return of generate_chars
  - convert each element in digit to an integer
  - assign decimal to 0
  - iterate through digits with index, using n and idx as parameters
    - add n*8^idx to digits

  - return digits

=end

class Octal
  attr_reader :num

  def initialize(num)
    @num = num
  end

  def to_decimal
    return 0 if !valid?
    decimal = 0
    generate_chars.each_with_index { |n, idx| decimal += n * (8**idx) }
    decimal
  end

  private

  def generate_chars
    num.to_s.chars.map(&:to_i).reverse
  end

  def valid?
    num.each_char { |char| return false unless ("0".."7").include?(char) }
  end
end
