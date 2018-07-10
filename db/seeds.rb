# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Sport.destroy_all
Event.destroy_all
Team.destroy_all

sports = ["basketball","tennis","soccer","volleyball","baseball"]

sports.each do |sport|
  Sport.create(name: sport)
  SportApi.games_infos(sport).each do |info|
    team1 = Team.find_or_create_by(name: info[:team1])
    team2 = Team.find_or_create_by(name: info[:team2])

    Event.find_or_create_by(team_a: team1, team_b: team2, sport: Sport.find_by(name: sport), league: info[:league], status: info[:status], score: info[:score],unique_event_id: info[:unique_event_id])
  end
end



