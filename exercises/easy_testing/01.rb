# Write a minitest assertion that will fail if the value.odd? is not true.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Mathmatics
  attr_reader :even_number, :odd_number

  def initialize
    @even_number = 2
    @odd_number = 1
  end
end

class MathmaticsTest < MiniTest::Test
  def setup
    @math = Mathmatics.new
  end

  def test_odd
    assert_equal(true, @math.odd_number.odd?)   # will pass
    assert_equal(true, @math.even_number.odd?)  # will fail

  end
end
