class Discount < ApplicationRecord
  has_many :product_discounts
  has_many :products, through: :product_discounts

  validates :value, :discount_type, :valid_from, :valid_upto, presence: true
end
