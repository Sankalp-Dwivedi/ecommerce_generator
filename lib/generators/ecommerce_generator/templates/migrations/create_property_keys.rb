class CreatePropertyKeys < ActiveRecord::Migration[6.1]
  def change
    create_table :property_keys do |t|
      t.string :name, null: false
      t.references :product_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
