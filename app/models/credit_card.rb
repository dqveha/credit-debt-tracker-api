class CreditCard < ApplicationRecord
  belongs_to :ledger, optional: true
  
  validates :credit_limit, presence: true
  validates :apr_purchases, presence: true
  validates :set_day_of_payment, presence: true

  scope :relative, ->(account_id) { where('ledger_id = ?', account_id)}
end
