class PropertyKey < ApplicationRecord
  belongs_to :product_category
  has_many :property_values

  validates :name, presence: true
end
