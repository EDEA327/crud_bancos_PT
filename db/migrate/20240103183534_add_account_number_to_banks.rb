class AddAccountNumberToBanks < ActiveRecord::Migration[7.1]
  def change
    add_column :banks, :account_number, :string
  end
end
