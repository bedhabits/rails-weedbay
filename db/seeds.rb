# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Product.update(photo_url: 'https://leafly-production.imgix.net/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fleafly-images%2Fflower-images%2Fbubba-kush.png?w=440&h=440&auto=format&fit=crop&dpr=2&q=25&ixlib=js-2.2.1&s=24c18fbc3ecf996465f17b1adbaaeda4')

