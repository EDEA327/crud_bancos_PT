class CreateBankAccounts < ActiveRecord::Migration[7.1]
  def change
    create_table :bank_accounts do |t|
      t.string :bank_name
      t.string :account_number
      t.references :provider, null: false, foreign_key: true

      t.timestamps
    end
  end
end
