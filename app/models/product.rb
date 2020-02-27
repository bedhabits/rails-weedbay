class Product < ApplicationRecord
  belongs_to :user
  has_many :product_orders
  has_one_attached :photo_url
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
    against: {
      price: 'A',
      weed_type: 'B',
      name: 'C',
      origin: 'D',
      effects: 'E',
      ailment: 'F',
      flavor: 'G'
    },
    associated_against: {
      user: [ :username, :email ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
