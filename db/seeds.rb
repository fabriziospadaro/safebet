# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ====Need to destroy Events before destroying Teams and Sports ===
puts 'Cleaning Events database...'
Event.destroy_all

# ===== # Creating Sports  ====
puts 'Cleaning Sports database...'
Sport.destroy_all

puts 'Creating sports...'
sports_attributes = [
 {
   name: 'Football',
 },
 {
   name: 'Basketball',
 },
 {
   name: 'Tennis',
 },
 {
   name: 'Baseball',
 }
]
Sport.create!(sports_attributes)
puts 'Finished creating Sports!'

# ===== # Creating teams for "Round of 16" in the real World Cup 2018 ====
puts 'Cleaning Teams database...'
Team.destroy_all

puts 'Creating teams...'
teams_attributes = [
 {
   name: 'TIE'
   # Display this team TIE as a winner when the result of a game is a TIE
 },
 {
   name: 'Russia',
 },
 {
   name: 'France',
 },
 {
   name: 'England',
 },
 {
   name: 'Argentina',
 },
 {
   name: 'Brazil',
 },
 {
   name: 'Belgium',
 },
 {
   name: 'Denmark',
 },
 {
   name: 'Sweden',
 },
 {
   name: 'Spain',
 },
 {
   name: 'Mexico',
 },
 {
   name: 'Switzerland',
 },
 {
   name: 'Uruguay',
 },
 {
   name: 'Portugal',
 },
 {
   name: 'Croatia',
 },
 {
   name: 'Japan',
 },
 {
   name: 'Colombia',
 }
 ]
Team.create!(teams_attributes)
