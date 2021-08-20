class CreditCard < ApplicationRecord
  belongs_to :ledger, optional: true
  
  validates :credit_balance, presence: true
  validates :apr_purchases, presence: true
  validates :set_day_of_payment, presence: true

  scope :relative, ->(account_id) { where('ledger_id = ?', account_id)}

  def self.calculate_month_interest(id)
    @credit_card = CreditCard.find(id)
    (@credit_card.credit_balance * (@credit_card.apr_purchases / 365)) * 30
  end
  
end
