# Write a minitest assertion that will fail if the Array list is not empty.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EmptyOrNot
  attr_reader :empty_array, :not_empty_array

  def initialize
    @empty_array = []
    @not_empty_array = [1, 2, 3]
  end
end

class TestEmptyOrNot < Minitest::Test
  def setup
    @empty_or_not = EmptyOrNot.new
  end

  def test_if_empty
    assert_empty(@empty_or_not.empty_array)       # will pass
    assert_empty(@empty_or_not.not_empty_array)   # will fail
  end
end
