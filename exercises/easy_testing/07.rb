# Write a minitest assertion that will fail if value is not an instance of the
# Numeric class exactly. value may not be an instance of one of Numeric's
# superclasses.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Numbers
  attr_reader :is_numeric, :is_integer, :is_not_numeric

  def initialize
    @is_numeric = Numeric.new
    @is_integer = 1
    @is_not_numeric = 'a'
  end
end

class NumbersTest < Minitest::Test
  def setup
    @numbers = Numbers.new
  end

  def test_if_numeric
    assert_instance_of Numeric, @numbers.is_numeric       # will pass
    assert_instance_of Numeric, @numbers.is_integer       # will fail
    assert_instance_of Numeric, @numbers.is_not_numeric   # will fail
  end
end
