# Write a minitest assertion that will fail if the class of value is not Numeric
# or one of Numeric's subclasses (e.g., Integer, Float, etc).

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class Numbers
  attr_reader :is_numeric, :is_numeric_subclass, :is_not_numeric

  def initialize
    @is_numeric = Numeric.new
    @is_numeric_subclass = 1
    @is_not_numeric = 'a'
  end
end

class NumbersTest < Minitest::Test
  def setup
    @numbers = Numbers.new
  end

  # my way:
  # def test_if_numeric
  #   assert_includes(@numbers.is_numeric.class.ancestors, Numeric)
  #   assert_includes(@numbers.is_numeric_subclass.class.ancestors, Numeric)
  #   assert_includes(@numbers.is_not_numeric.class.ancestors, Numeric)
  # end

  # correct way:
  def test_is_numeric
    assert_kind_of Numeric, @numbers.is_numeric           # will pass
    assert_kind_of Numeric, @numbers.is_numeric_subclass  # will pass
    assert_kind_of Numeric, @numbers.is_not_numeric       # will failrub
  end
end
