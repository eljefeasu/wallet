require 'test_helper'

class TransactionTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  test "balance is zero" do
    @balance = Transaction.balance
    assert_equal @balance, 0
  end

end
