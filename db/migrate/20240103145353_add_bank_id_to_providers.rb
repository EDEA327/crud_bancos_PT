class AddBankIdToProviders < ActiveRecord::Migration[7.1]
  def change
    add_reference :providers, :bank, null: false, foreign_key: true
  end
end
