class Bank < ApplicationRecord
  has_many :providers, dependent: :nullify
  validates :name, uniqueness: true, presence: true, length: { maximum: 50 }
end
