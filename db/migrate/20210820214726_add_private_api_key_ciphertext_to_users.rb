class AddPrivateApiKeyCiphertextToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :private_api_key_ciphertext, :text
    
    add_column :users, :private_api_key_bidx, :string
    add_index :users, :private_api_key_bidx, unique: true
  end
end