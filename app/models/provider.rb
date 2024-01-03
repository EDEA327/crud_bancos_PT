class Provider < ApplicationRecord
  belongs_to :bank

  validates :name, presence: true, length: { maximum: 255 }
  validates :nit, format: { with: /\A\d{9}-\d?\z/, message: 'must be in the format 123456789-0' }, allow_blank: true, uniqueness: true
  validates :contact_name, presence: true, length: { maximum: 255 }
  validates :contact_phone, length: { maximum: 10 }, allow_blank: true
end
