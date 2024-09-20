class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.decimal :checkout_price, precision: 10, scale: 2, null: false
      t.string :status, null: false
      t.string :payment_type, null: false
      t.string :payment_status, null: false

      t.timestamps
    end
  end
end
