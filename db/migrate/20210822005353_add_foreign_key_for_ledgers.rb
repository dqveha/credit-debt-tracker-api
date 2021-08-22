class AddForeignKeyForLedgers < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :ledgers, :users, on_delete: :cascade
  end
end
