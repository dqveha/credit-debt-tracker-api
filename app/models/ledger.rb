class Ledger < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :user_id, :message => "can only have one Ledger"

  has_many :credit_cards, dependent: :destroy
  
  validates :account_name, presence: true
  validates :user_id, presence: true

end
