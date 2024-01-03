class CreateProviders < ActiveRecord::Migration[7.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :nit
      t.string :contact_name
      t.string :contact_phone
      t.references :bank, foreign_key: true
      t.timestamps
    end
  end
end
