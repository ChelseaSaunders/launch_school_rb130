=begin
Write a program that manages robot factory settings.

When robots come off the factory floor, they have no name. The first time you
boot them up, a random name is generated, such as RX837 or BC811.

Every once in a while, we need to reset a robot to its factory settings, which
means that their name gets wiped. The next time you ask, it will respond with a
new random name.

The names must be random; they should not follow a predictable sequence. Random
names means there is a risk of collisions. Your solution should not allow the
use of the same name twice when avoidable.

PROBLEM
generate names that consist of 2 capital letters followed by 3 digits
each new instance should have a unique name
instances should be able to be renamed with a unique name
no name should be used twice

EXAMPLES

DATA
output must be string, no input

ALGORITHM
create class Robot
create attr_accessor for name
upon initialization, assign new name that consists of 2 random capital letters
  and 3 random digits (use helper method, generate_name)
create class variable used_names and assign to empty array
create generate_name instance method
  create empty string name
  create loop
  pick random lettter from A-Z two times, append to name
  pick random digit from 0-9 three times, append to name
  break unless used_names includes name
  add name to used_names
  return name

create reset method
  assign instance variable name to nil and remove prior name from used_names
=end

# rubocop:disable Style/ClassVars

# While class variables are problematic in more complicated applications, for
# the purposes of this exercise, a class variable seems the most efficient way
# to track name data, so I feel it is appropriate to disable the corresponding
# cop.

class Robot
  attr_accessor :name

  LETTERS = ('A'..'Z').to_a
  DIGITS = ('0'..'9').to_a
  @@used_names = []

  def initialize
    @name = generate_name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  private

  def generate_name
    new_name = ''

    loop do
      2.times { new_name << LETTERS.sample }
      3.times { new_name << DIGITS.sample }
      break unless @@used_names.include?(new_name)
      new_name = ''
    end

    @@used_names << new_name
    new_name
  end
end

# rubocop:enable Style/ClassVars
