class Order < ApplicationRecord
  belongs_to :user
  has_many :product_orders
  has_many :reviews
  has_many :products, through: :product_orders

  validates :status, presence: true, inclusion: { in: %w(open closed), message: "%{value} is not a valid order status" }
  validates :address, presence: true
end
