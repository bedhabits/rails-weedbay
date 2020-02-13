class AddReviewToProductOrder < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reviews, :order
    add_reference :reviews, :product_order, foreign_key: true


  end
end
