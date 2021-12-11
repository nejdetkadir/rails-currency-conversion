class CreateConversions < ActiveRecord::Migration[6.1]
  def change
    create_table :conversions do |t|
      t.references :currency, null: false, foreign_key: true
      t.references :to, null: false, foreign_key: { to_table: :currencies }

      t.timestamps
    end
  end
end
