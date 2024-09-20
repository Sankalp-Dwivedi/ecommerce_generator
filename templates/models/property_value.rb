class PropertyValue < ApplicationRecord
  belongs_to :property_key
  belongs_to :product

  validates :value, presence: true
end
