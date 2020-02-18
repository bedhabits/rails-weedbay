# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

puts "destroying all seeds"
User.destroy_all
Product.destroy_all

puts "creating all seeds"
user = User.create!(email: "admin@weedbay.com", password: "123456", address: "Zion")


csv_options = { col_sep: ';', headers: :first_row }
file_path = 'db/products.csv'
CSV.foreach(file_path, csv_options) do |row|
  Product.create!(name: row['name'], weed_type: row['type'], origin: row['location'], price: row['price'], user_id: user.id)
end

puts "done"
