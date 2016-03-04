class Transaction < ActiveRecord::Base

  # def self.balance
  #   credits = 0
  #   debits = 0
  #   self.all.each do |transaction|
  #     credits += transaction.amount if transaction.debit_or_credit == "Credit"
  #     debits += transaction.amount if transaction.debit_or_credit == "Debit"
  #   end
  #   credits - debits
  # end

  # def absolute_amount
  #   if debit_or_credit == "Credit"
  #     amount
  #   else
  #     amount * -1
  #   end
  # end
  #
  # def self.balance
  #   self.all.reduce(0.0) {|sum, t| sum + t.absolute_amount}
  # end

  def self.balance
    where(debit_or_credit: "Credit").sum(:amount) - where(debit_or_credit: "Debit").sum(:amount)
  end

  def self.total_current_month
    # @total_current_month = 0
    # current_time = Time.now
    # current_month = current_time.mon
    # self.all.each do |transaction|
    #   if ((transaction.debit_or_credit == "Debit") && (transaction.created_at.mon == current_month))
    #     @total_current_month += transaction.amount
    #   end
    # end
    # @total_current_month
    start_time = Time.now.beginning_of_month
    end_time = Time.now.end_of_month
    where(debit_or_credit: "Debit")
        .where("created_at BETWEEN ? and ?", start_time, end_time)
        .sum(:amount)
  end

  def self.total_previous_month
    start_time = (Time.now - 1.month).beginning_of_month
    end_time = (Time.now - 1.month).end_of_month
    where(debit_or_credit: "Debit")
        .where("created_at BETWEEN ? and ?", start_time, end_time)
        .sum(:amount)
  end

  def self.transactions_current_month
    start_time = Time.now.beginning_of_month
    end_time = Time.now.end_of_month
    where("created_at BETWEEN ? and ?", start_time, end_time).count
  end

  def self.transactions_previous_month
    start_time = (Time.now - 1.month).beginning_of_month
    end_time = (Time.now - 1.month).end_of_month
    where("created_at BETWEEN ? and ?", start_time, end_time).count
  end

  def self.biggest_expense_current_month
    start_time = Time.now.beginning_of_month
    end_time = Time.now.end_of_month
    where("created_at BETWEEN ? and ?", start_time, end_time).order(amount: :desc).first
  end

  def self.biggest_expense_ever
    order(amount: :desc).first
  end

  # def self.place_spent_most_money
  #   place_spent_most_money = ""
  #   most_money = 0
  #   self.all.each do |transaction|
  #     name = transaction.description
  #     place_total = transaction.amount
  #     self.all.each do |t|
  #       if t.description == name && t.debit_or_credit == "Debit"
  #         place_total += t.amount
  #       end
  #     end
  #     if place_total > most_money
  #       place_spent_most_money = transaction.description
  #       most_money = place_total
  #     end
  #   end
  #   place_spent_most_money
  # end

  def self.place_spent_most_money
    if where(debit_or_credit: "Debit").count == 0
      "N/A"
    else
      where(debit_or_credit: "Debit").group(:description).order("SUM(amount) DESC").first.description
    end
  end

  def self.statistics
    return {place_spent_most_money: place_spent_most_money,
      biggest_expense_ever: biggest_expense_ever}
  end

end
