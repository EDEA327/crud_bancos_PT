class AddAccountNumberToProviders < ActiveRecord::Migration[7.1]
  def change
    add_column :providers, :account_number, :string
  end
end
