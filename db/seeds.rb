# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

3.times do
    SingleRoom.create(
      number: Faker::Number.unique.between(from: 100, to: 199),
      price: Faker::Number.between(from: 50, to: 100)
    )
  end
  
  # Create double rooms
  3.times do
    DoubleRoom.create(
      number: Faker::Number.unique.between(from: 200, to: 299),
      price: Faker::Number.between(from: 100, to: 150)
    )
  end
  
  # Create suite rooms
  3.times do
    Suite.create(
      number: Faker::Number.unique.between(from: 300, to: 399),
      price: Faker::Number.between(from: 150, to: 200)
    )
  end
