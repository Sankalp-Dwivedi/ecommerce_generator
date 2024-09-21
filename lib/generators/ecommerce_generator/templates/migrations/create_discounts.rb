class CreateDiscounts < ActiveRecord::Migration[6.1]
  def change
    create_table :discounts do |t|
      t.decimal :value, precision: 5, scale: 2, null: false
      t.string :discount_type, null: false
      t.datetime :valid_from, null: false
      t.datetime :valid_upto, null: false

      t.timestamps
    end
  end
end
