class ChangeColumnOnUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :username, false
    change_column_null :users, :address, false
    change_column_null :products, :name, false
    change_column_null :products, :origin, false
    change_column_null :products, :price, false
    change_column_null :products, :type, false
    change_column_null :product_orders, :quantity, false
    change_column_null :orders, :address, false
    change_column :orders, :status, :string, null: false, default: 'open'

    remove_column :products, :unit, :string
  end
end
