class CreateCreditCard < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.integer :credit_balance
      # t.float :annual_fees
      t.float :apr_purchases
      # t.float :apr_cash
      # t.float :apr_promotional
      t.date :set_day_of_payment
      t.integer :ledger_id

      t.timestamps
    end
    add_foreign_key :credit_cards, :ledgers
  end
end
