require 'test_helper'

class TransactionTest < ActiveSupport::TestCase

  test "the truth" do
    assert true
  end

  test "balance is zero" do
    @balance = Transaction.balance
    assert_equal @balance, 0
  end

  test "transactions current month total" do
    @transactions = Transaction.all
    t = Transaction.create!(amount: 30, debit_or_credit: "Debit")
    assert_equal 30, @transactions.total_current_month
  end

  test "transactions previous month total" do
    @transactions = Transaction.all
    t = Transaction.create!(amount: 30, debit_or_credit: "Debit")
    assert_equal 0, @transactions.total_previous_month
  end

  test "transactions current month" do
    @transactions = Transaction.all
    t = Transaction.create!(amount: 30, debit_or_credit: "Debit")
    assert_equal 3, @transactions.transactions_current_month
  end

  test "transactions previous month" do
    @transactions = Transaction.all
    t = Transaction.create!(amount: 30, debit_or_credit: "Debit")
    assert_equal 0, @transactions.transactions_previous_month
  end

  test "biggest expense current month" do
    @transactions = Transaction.all
    t = Transaction.create!(amount: 30, debit_or_credit: "Debit")
    assert_equal 30, @transactions.biggest_expense_current_month
  end

end
