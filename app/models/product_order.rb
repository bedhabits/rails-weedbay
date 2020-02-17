class ProductOrder < ApplicationRecord
  belongs_to :product
  belongs_to :order, optional: true
  belongs_to :cart

  # validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def total_price
    self.quantity * self.price
  end
end
