class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :origin
      t.string :unit
      t.string :photo_url
      t.float :price
      t.float :thc
      t.float :cbd
      t.string :type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
