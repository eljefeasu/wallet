class Transaction < ActiveRecord::Base
  def self.balance
    credits = 0
    debits = 0
    self.all.each do |transaction|
      credits += transaction.amount if transaction.debit_or_credit == "Credit"
      debits += transaction.amount if transaction.debit_or_credit == "Debit"
    end
    @balance = credits - debits
  end
end
