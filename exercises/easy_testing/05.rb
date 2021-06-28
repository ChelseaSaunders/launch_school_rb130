# Write a minitest assertion that will fail if the 'xyz' is not in the Array list.

require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class ArrayList
  attr_reader :arr_with_xyz, :arr_without_xyz

  def initialize
    @arr_with_xyz = ['xyz', 'abc', '123']
    @arr_without_xyz = ['abc', '123']
  end
end

new_arr = ArrayList.new

class TestArrayList < Minitest::Test
  def setup
    @array_list = ArrayList.new
  end

  def test_include_xyz
    assert_includes(@array_list.arr_with_xyz, 'xyz')      # will pass
    assert_includes(@array_list.arr_without_xyz, 'xyz')   # will fail
  end
end
