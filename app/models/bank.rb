class Bank < ApplicationRecord
  has_many :providers
  validates :name, uniqueness: true, presence: true, length: { maximum: 50 }
  validates :account_number, length: { maximum: 15 }, allow_blank: true
end
