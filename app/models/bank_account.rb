class BankAccount < ApplicationRecord
  validates :bank_name, presence: true
  validates :account_number, length: { maximum: 15 }, allow_blank: true

  belongs_to :provider
  belongs_to :bank
end
