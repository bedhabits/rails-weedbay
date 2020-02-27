class AddColumnsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :effects, :string
    add_column :products, :ailment, :string
    add_column :products, :flavor, :string
  end
end
