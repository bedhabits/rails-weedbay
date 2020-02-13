class Product < ApplicationRecord
  belongs_to :user
  has_many :product_orders
  # def product_orders
  #    ProductOrder.where(product_id: self.id)
  #  end
  has_many :orders, through: :product_orders
  has_many :reviews, through: :orders

  validates :name, presence: true
  validates :origin, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :weed_type, inclusion: { in: %w(sativa indica hybrid ruderalis), message: "%{value} is not a valid weed type" }
end
