# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying all seeds"
User.destroy_all
Product.destroy_all

puts "creating all seeds"
user = User.create!(email: "radu.popescu@priceedge.se", password: "Soricel5238", address: "Martins Sarmento 60")
Product.create!(name: "Diamond Dust", weed_type: "Sativa", origin: "Portland", price: 10, user_id: user.id)
Product.create!(name: "Girl Scout Cookies", weed_type: "Hybrid", origin: "Cali", price: 11, user_id: user.id)
Product.create!(name: "Lemon Haze", weed_type: "Sativa", origin: "Lisbon", price: 12, user_id: user.id)
Product.create!(name: "Black Widow", weed_type: "Indica", origin: "Adam", price: 10, user_id: user.id)

puts "done"
