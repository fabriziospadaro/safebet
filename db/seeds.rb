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
puts 'Finished creating Teams!'

# ===== # Creating Events for World Cup 2018 ====
puts 'Cleaning Events database...'
Event.destroy_all

puts 'Creating events...'
events_attributes = [
 {
   team_a: Team.find_by(name: "Russia"),
   team_b: Team.find_by(name: "France"),
   # # not played yet - winner_id: Optional / Will be created later
   winner: Team.find_by(name: "Russia"),
   sport:  Sport.find_by(name: "Football"),
   # type of this 'date' parameter is DATETIME
   date: '2018-07-09T20:00:00',
   score: "2-1"
 },
{
   team_a: Team.find_by(name: "England"),
   team_b: Team.find_by(name: "Argentina"),
   # # not played yet - winner_id: Optional / Game not played yet - false
   winner: Team.find_by(name: "TIE"),
   sport:  Sport.find_by(name: "Football"),
   # type of this 'date' parameter is DATETIME
   date: '2018-07-10T06:00:00',
   score: "1-1"
 },
{
   team_a: Team.find_by(name: "Brazil"),
   team_b: Team.find_by(name: "Belgium"),
   # # not played yet - winner_id: Optional / Game not played yet - false
   winner_id: false,
   sport:  Sport.find_by(name: "Football"),
   # type of this 'date' parameter is DATETIME
   date: '2018-07-10T18:00:00',
   score: "-"
 },
 {
   team_a: Team.find_by(name: "Denmark"),
   team_b: Team.find_by(name: "Sweden"),
   # # not played yet - winner_id: Optional / Game not played yet - false
   winner_id: false,
   sport:  Sport.find_by(name: "Football"),
   # type of this 'date' parameter is DATETIME
   date:  '2018-07-10T19:00:00',
   score: "-"
 },
 {
   team_a: Team.find_by(name: "Spain"),
   team_b: Team.find_by(name: "Mexico"),
   # # not played yet - winner_id: Optional / Game not played yet - false
   # winner_id: false,
   sport:  Sport.find_by(name: "Football"),
   # type of this 'date' parameter is DATETIME
   date: '2018-07-10T20:00:00',
   score: "-"
 },
 {
   team_a: Team.find_by(name: "Switzerland"),
   team_b: Team.find_by(name: "Uruguay"),
   # # not played yet - winner_id: Optional / Game not played yet - false
   # winner_id: false,
   sport:  Sport.find_by(name: "Football"),
   # type of this 'date' parameter is DATETIME
   date: '2018-07-10T21:00:00',
   score: "-"
 },
{
   team_a: Team.find_by(name: "Portugal"),
   team_b: Team.find_by(name: "Croatia"),
   # # not played yet - winner_id: Optional / Game not played yet - false
   # winner_id: false,
   sport:  Sport.find_by(name: "Football"),
   # type of this 'date' parameter is DATETIME
   date: '2018-07-10T22:00:00',
   score: "-"
 },
{
   team_a: Team.find_by(name: "Japan"),
   team_b: Team.find_by(name: "Colombia"),
   # # not played yet - winner_id: Optional / Game not played yet - false
   # winner_id: false,
   sport:  Sport.find_by(name: "Football"),
   # type of this 'date' parameter is DATETIME
   date: '2018-07-11T06:00:00',
   score: "-"
 },
]

Event.create!(events_attributes)
puts 'Finished creating Events!'


# ==== REFERENCE ===

# date: Date.today,
# date: 4.days.ago,
# p Time.now

# create_table "events", force: :cascade do |t|
#     t.integer "odds"
#     t.integer "team_a_id"
#     t.integer "team_b_id"
#     t.integer "winner_id"
#     t.bigint "sport_id"
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.string "league"
#     t.string "status"
#     t.string "score"
#     t.string "unique_event_id"
#     t.datetime "date"
#     t.index ["sport_id"], name: "index_events_on_sport_id"
#   end
