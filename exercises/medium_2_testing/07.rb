# You may have noticed something when running the test for the previous
# exercise. And that is that our minitest output wasn't that clean. We have
# some residual output from the Transaction#prompt_for_payment method.

# Run options: --seed 52842

# # Running:

# You owe $30.                # Extra/unwanted
# How much are you paying?    # Extra/unwanted
# .                           # Extra/unwanted

# Finished in 0.001783s, 560.7402 runs/s, 560.7402 assertions/s.

# 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips

# Transaction#prompt_for_payment has a call to Kernel#puts and that output is
# showing up when we run our test. Your task for this exercise is to make it so
# that we have "clean" output when running this test. We want to see something
# like this:

# Run options: --seed 4957

# # Running:

# .

# Finished in 0.000919s, 1087.9984 runs/s, 1087.9984 assertions/s.

# 1 runs, 1 assertions, 0 failures, 0 errors, 0 skips

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
    output = StringIO.new

    @transaction.prompt_for_payment(input: input, output: output)

    assert_equal 10, @transaction.amount_paid
  end
end
