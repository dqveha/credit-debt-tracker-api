class CreateLedgers < ActiveRecord::Migration[5.2]
  def change
    create_table :ledgers do |t|
      t.string :account_name

      t.timestamps
    end
  end
end
