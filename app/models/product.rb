class Product < ApplicationRecord
  belongs_to :user
  has_many :product_orders
  # def product_orders
  #    ProductOrder.where(product_id: self.id)
  #  end
  has_many :orders, through: :product_orders
  has_many :reviews, through: :orders

  validates :name, presence: true
  validates :origin, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :weed_type, inclusion: { in: %w(Sativa Indica Hybrid Ruderalis), message: "%{value} is not a valid weed type" }
  validates :photo_url, presence: true

  include PgSearch::Model
  pg_search_scope :product_search,
    against: [ :name, :origin, :weed_type ],
    associated_against: {
      user: [ :username, :email ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
