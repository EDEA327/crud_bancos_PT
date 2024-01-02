class BankAccount < ApplicationRecord
  belongs_to :provider
  validates :bank_name, presence: true
  validates :account_number, length: { maximum: 15 }, allow_blank: true
end
