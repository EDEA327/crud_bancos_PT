class CreateProviders < ActiveRecord::Migration[7.1]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :nit
      t.string :contact_name
      t.string :contact_phone

      t.timestamps
    end
  end
end
