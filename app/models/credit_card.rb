class CreditCard < ApplicationRecord
  belongs_to :ledger 
  
  scope :relative, ->(account_id) { where('ledger_id = ?', account_id)}
end
