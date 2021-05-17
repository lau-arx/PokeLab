# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
sacha = User.create!(email: "sacha@gmail.com", password: "password")
Pokemon.create!(user: sacha, name: "pikachu", category: "electricite", description: "blabla", height: 50, weight: 3, special_attack: "foudre", price_per_day: 15, health_point: 50)
