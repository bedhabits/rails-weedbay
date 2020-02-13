class Product < ApplicationRecord
  belongs_to :user
  has_many :product_orders
  has_many :orders, through: :product_orders
  has_many :reviews, through: :orders

  validates :name, presence: true
  validates :origin, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :type, inclusion: { in: %w(sativa indica hybrid ruderalis), message: "%{value} is not a valid weed type" }
end
