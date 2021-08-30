# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Book.destroy_all
Store.destroy_all

abc = Store.create!(name: "ABC Store", open_on_weekends: true, inventory: 689)
kiddos = Store.create!(name: "Kiddos Book Store", open_on_weekends: true, inventory: 885)
books_and_burgers = Store.create!(name: "Books and Burgers", open_on_weekends: true, inventory: 298)
rails = Store.create!(name: "Rails Book Shop", open_on_weekends: false, inventory: 532)

how_to_ruby = abc.books.create!(title: "How to Ruby", price: 19.99, kids_friendly: false)
harry = abc.books.create!(title: "Harry Potter: 1st book", price: 29.99, kids_friendly: true)

elmo = kiddos.books.create!(title: "Elmo: the potty book", price: 9.99, kids_friendly: true)
math = kiddos.books.create!(title: "Basic Math", price: 12.99, kids_friendly: true)

boo_boo = books_and_burgers.books.create!(title: "Boo boo", price: 19.99, kids_friendly: true)
social = books_and_burgers.books.create!(title: "Social Justice", price: 19.99, kids_friendly: false)

ruby = rails.books.create!(title: "Ruby on Rails", price: 39.99, kids_friendly: false)
rails_practice = rails.books.create!(title: "Best Rails Practice", price: 49.99, kids_friendly: false)
