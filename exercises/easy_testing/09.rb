# Write a test that will fail if list and the return value of list.process are
# different objects.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class List
  def process
    1
  end

end

class TestList < Minitest::Test
  def setup
    @list = List.new
  end

  def test_process_return
    assert_same @list, @list.process # will fail
  end
end
