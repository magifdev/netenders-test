# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Todo.destroy_all
puts 'Database cleared'

puts 'Seeding...'
User.create!(name: 'Phillip H', email: 'philliph@gmail.com')
User.create!(name: 'James B', email: 'jamesb@gmail.com')
User.create!(name: 'Christina C', email: 'christinac@gmail.com')

puts 'Seeding finished!'
