# We now have the foundation of our CashRegister test class set up. Let's start
# testing! We'll start with the CashRegister#accept_money method. Write a test
# for the #accept_money method.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TestCashRegister < Minitest::Test
  def setup
    @cash_register = CashRegister.new(0)
    @transaction = Transaction.new(5)
  end

  def test_accept_money
    @transaction.amount_paid = 5
    new_total = @cash_register.total_money + 5
    cash_register_total = @cash_register.accept_money(@transaction)

    assert_equal new_total, cash_register_total
    assert_equal 5, cash_register_total
  end
end
