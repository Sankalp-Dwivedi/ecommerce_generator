class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :quantity, :checkout_price, :status, :payment_type, :payment_status, presence: true
end
