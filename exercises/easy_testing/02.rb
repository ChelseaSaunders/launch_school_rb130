# Write a minitest assertion that will fail if value.downcase does not return
# 'xyz'.

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class Letters
  attr_reader :xyz, :not_xyz

  def initialize
    @xyz = 'XYZ'
    @not_xyz = 'abc'
  end
end

class LettersTest < Minitest::Test
  def setup
    @letters = Letters.new
  end

  def test_xyz
    assert_equal('xyz', @letters.xyz.downcase)      # will pass
    assert_equal('xyz', @letters.not_xyz.downcase)  # will fail
  end
end
