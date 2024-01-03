class Provider < ApplicationRecord
  belongs_to :bank
  has_one :bank_account
  validates :name, :nit, :contact_name, presence: true
  validates :nit, format: { with: /\A\d{9}-\d?\z/, message: I18n.t('providers.errors.nit') }
  validates :contact_phone, length: { maximum: 10 }, allow_blank: true
end
