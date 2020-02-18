class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order, optional: true
  belongs_to :cart

  # validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def total_price
    self.quantity * self.price
  end

  def sub_total
    sum = 0
    self.each do |product_order|
      sum += product_order.total_price
    end
    return sum
  end
end
