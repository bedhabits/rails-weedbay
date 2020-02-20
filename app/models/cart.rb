class Cart < ApplicationRecord
  has_many :product_orders, dependent: :destroy
  has_many :products, through: :product_orders

  def sub_total
    sum = 0
    self.product_orders.each do |product_order|
      sum += product_order.total_price
    end
    return sum
  end

  def total_qty
    qty = 0
    self.product_orders.each do |product_order|
      qty += product_order.quantity
    end
    return qty
  end
end
