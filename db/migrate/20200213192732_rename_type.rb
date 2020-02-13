class RenameType < ActiveRecord::Migration[5.2]
  def change
    rename_column :products, :type, :weed_type
  end
end
