class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, dependent: :destroy
  has_many :orders, dependent: :destroy

  # user can buy and want to see bought orders
  # has_many :product_orders, through: :orders

  # user can sell and want to see sold orders
  # has_many :product_orders, through: :products

end
