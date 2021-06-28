# Write a minitest assertion that will fail unless employee.hire raises a
# NoExperienceError exception.

require 'minitest/autorun'
require 'minitest/reporters'

Minitest::Reporters.use!

class Employee
  def hire(decision)
    raise NoExperienceError if decision == 'no'
    true
  end
end

class TestEmployee < Minitest::Test
  def setup
    @employee = Employee.new
  end

  def test_hire_error
    assert_raises(NoExperienceError) { @employee.hire('no') }
    assert_raises(NoExperienceError) { @employee.hire('yes') }
  end
end
