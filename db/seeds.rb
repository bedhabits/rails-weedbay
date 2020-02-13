# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(username: "radu", email: "radu.popescu@priceedge.se", password: "Soricel5238", address: "Martins Sarmento 60")
Product.create!(name: "Diamond Dust", weed_type: "sativa", origin: "Portland", price: 10, user_id: 1)
Product.create!(name: "Girl Scout Cookies", weed_type: "hybrid", origin: "Cali", price: 11, user_id: 1)
Product.create!(name: "Lemon Haze", weed_type: "sativa", origin: "Lisbon", price: 12, user_id: 1)
Product.create!(name: "Black Widow", weed_type: "indica", origin: "Adam", price: 10, user_id: 1)
