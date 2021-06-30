# Write a test that verifies that Transaction#prompt_for_payment sets the
# amount_paid correctly.

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class TestTransaction < Minitest::Test
  def setup
    @cash_register = CashRegister.new(0)
    @transaction = Transaction.new(5)
  end

  def test_prompt_for_payment
    input = StringIO.new("10\n")
    @transaction.prompt_for_payment(input: input)

    assert_equal 10, @transaction.amount_paid
  end
end
