class Product < ApplicationRecord
  belongs_to :product_category
  has_many :property_values
  has_many :product_discounts
  has_many :discounts, through: :product_discounts

  validates :name, :description, :price, presence: true
end
