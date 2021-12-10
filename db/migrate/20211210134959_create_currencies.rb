class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :iso_code, null: false
      t.decimal :rate, null: false
      t.boolean :is_base, default: false

      t.timestamps
    end

    add_index :currencies, :iso_code, unique: true
  end
end
