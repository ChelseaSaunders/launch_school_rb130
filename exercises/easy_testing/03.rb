# Write a minitest assertion that will fail if value is not nil.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class NilOrNot
  attr_reader :nil_value, :not_nil_value

  def initialize
    @nil_value = nil
    @not_nil_value = 1
  end
end

class NilOrNotTest < MiniTest::Test
  def setup
    @nil_or_not = NilOrNot.new
  end

  def test_nil_value
    assert_nil(@nil_or_not.nil_value)       # will pass
    assert_nil(@nil_or_not.not_nil_value)   # will fail
  end
end
