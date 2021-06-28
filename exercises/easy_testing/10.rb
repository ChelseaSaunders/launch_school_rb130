# Write a test that will fail if 'xyz' is one of the elements in the Array list:

require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class List
  attr_reader :has_xyz, :does_not_have_xyz

  def initialize
    @has_xyz = ['xyz', 'abc', '123']
    @does_not_have_xyz = ['abc', '123']
  end
end

class Test  < Minitest::Test
  def setup
    @list = List.new
  end

  def test_no_xyz
    refute_includes @list.does_not_have_xyz, 'xyz' # will pass
    refute_includes @list.has_xyz, 'xyz' # will fail
  end
end
