# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Score.destroy_all
Game.destroy_all
User.destroy_all


users = User.create!([
  { name: "Alice", email: "alice@example.com", password: "password" },
  { name: "Bob", email: "bob@example.com", password: "password" },
  { name: "Carol", email: "carol@example.com", password: "password" }
])

games = Game.create!([
  { name: "Connect Four", genre: "Strategy" },
  { name: "Candy Land", genre: "Children" },
  { name: "Trouble", genre: "Family" },
  { name: "Monopoly", genre: "Board" },
  { name: "Catan", genre: "Strategy" }
])


Score.create!([
  { points: 100, round_number: 1, user: users[0], game: games[0] },
  { points: 120, round_number: 2, user: users[0], game: games[1] },
  { points: 90,  round_number: 1, user: users[1], game: games[0] },
  { points: 150, round_number: 1, user: users[1], game: games[2] },
  { points: 200, round_number: 1, user: users[2], game: games[3] },
  { points: 180, round_number: 2, user: users[2], game: games[4] }
])

puts "Seeding done!"
puts "Users: #{User.count}, Games: #{Game.count}, Scores: #{Score.count}"
