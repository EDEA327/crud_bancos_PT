class Provider < ApplicationRecord
  validates :name, :contact_name, :bank_name, presence: true
  validates :nit, format: { with: /\A\d{9}-\d{1}?\z/ }, uniqueness: true
  validates :contact_phone, length: { maximum: 10 }, allow_blank: true

  has_one :bank_account, dependent: :destroy
  accepts_nested_attributes_for :bank_account

  def self.available_banks
    Bank.pluck(:name)
  end
end
