class Order < ApplicationRecord
  belongs_to :user
  has_many :product_orders, dependent: :destroy
  has_many :reviews
  has_many :products, through: :product_orders

  # validates :status, presence: false, inclusion: { in: %w(open closed), message: "%{value} is not a valid order status" }
  # validates :address, presence: false
  def sub_total
    sum = 0
    self.product_orders.each do |product_order|
      sum += product_order.total_price
    end
    return sum
  end
end
