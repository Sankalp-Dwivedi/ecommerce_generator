class CreatePropertyValues < ActiveRecord::Migration[6.1]
  def change
    create_table :property_values do |t|
      t.references :property_key, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.string :value, null: false

      t.timestamps
    end
  end
end
