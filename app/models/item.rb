class Item < ApplicationRecord
  has_many :positions
  has_many :carts, through: :positions

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0, allow_nil: true }

  # has_and_belongs_to_many :carts
end
