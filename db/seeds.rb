# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Offer.destroy_all
User.destroy_all

titles = ["Speakers", "DJ table", "Lights", "Smoke machine", "Beer tap"]
categories = ["Sound", "Lights", "Alcohol", "Decorations", "Misc"]

user1 = User.create(username: "user")

10.times do
  offer = Offer.new(title: titles.sample, price: rand(1..100), location: Faker::Address.full_address, category: categories.sample)
  offer.user = user1
  offer.save
end
