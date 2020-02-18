class AddCartRefToProductOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_orders, :cart, foreign_key: true
  end
end
