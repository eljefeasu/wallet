class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :description
      t.decimal :amount
      t.boolean :debit_or_credit

      t.timestamps null: false
    end
  end
end
