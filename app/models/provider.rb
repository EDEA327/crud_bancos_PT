class Provider < ApplicationRecord
  belongs_to :user
  belongs_to :bank, touch: true, optional: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :nit, format: { with: /\A\d{9}-\d?\z/, message: 'must be in the format 123456789-0' }, allow_blank: true, uniqueness: true
  validates :contact_name, presence: true, length: { maximum: 255 }
  validates :contact_phone, length: { maximum: 10 }, allow_blank: true
  validates :account_number, presence: true, length: { maximum: 15 }

  after_update :update_associated_providers
  after_destroy :clear_bank_association

  private

  def update_associated_providers
    # Actualiza la marca de tiempo de los proveedores asociados cuando se actualiza el banco
    if saved_change_to_bank_id?
      Provider.where(bank_id: saved_change_to_bank_id[0]).update_all(updated_at: Time.current)
    end
  end

  def clear_bank_association
    # Actualiza la marca de tiempo de los proveedores asociados cuando se elimina el banco
    Provider.where(bank_id: bank_id).update_all(updated_at: Time.current) if bank_id.present?
  end
end
