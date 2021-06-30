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

  def test_change
    @transaction.amount_paid = 10
    expected_change = @transaction.amount_paid - @transaction.item_cost
    cash_register_change = @cash_register.change(@transaction)

    assert_equal expected_change, cash_register_change
    assert_equal 5, cash_register_change
  end

  def test_give_receipt
    receipt_output = "You've paid $#{@transaction.item_cost}.\n"

    assert_output(receipt_output) { @cash_register.give_receipt(@transaction) }
  end
end
