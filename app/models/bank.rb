class Bank < ApplicationRecord
  validates :name, uniqueness: true, presence: true, length: { maximum: 50 }

  has_many :bank_accounts
end
