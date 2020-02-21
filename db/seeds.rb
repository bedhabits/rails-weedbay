# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

puts "destroying all seeds"
Order.destroy_all
ProductOrder.destroy_all
User.destroy_all
Product.destroy_all


puts "creating admin user"
user = User.create!(email: "admin@weedbay.com", password: "123456", address: "Le wagon, Lisbon")

puts "creating all seeds"
file = 'db/seeds_image.csv'
csv_options = { col_sep: ';', headers: :first_row }
CSV.foreach(file, csv_options) do |csv|
  Product.create(
                name: csv["name"],
                weed_type: csv["weed_type"],
                origin: csv["origin"],
                photo_url: csv["photo_url"],
                price: csv["price"],
                user_id: user.id
                )
end

puts "done"
