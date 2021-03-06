# ===== # Creating Sports  ====
#deleting A SPORT WILL REMOVE ALL THE EVENTS ASSOCIATED WITH HIM VERY DANGEROUS
puts 'Updating or creating sports/leagues...'
SoccerLeague = [
  "World Cup 2018",
  "UEFA Europa League Qualifying",
  "Europe Friendlies",
  "Argentina Cup",
  "Iceland Premier League",
  "Copa do Brasil",
  "Russia Division 1",
  "USA MLS",
  "Caf Champions League",
  "China Super League",
]

BasketballLeague = [
"all",
"GFG",
"GRGRG",
]

TennisLeague = [
"all",
"GRG",
"GRGR",
]

BaseballLeague = [
"all",
"GRG",
"GRG",
]


sports_attributes = [
 {
   name: 'Soccer',
   leagues_string: SoccerLeague.join("-"),
 },
 {
   name: 'Basketball',
   leagues_string: BasketballLeague.join("-"),
 },
 {
   name: 'Tennis',
   leagues_string: TennisLeague.join("-"),
 },
 {
   name: 'Baseball',
   leagues_string: BaseballLeague.join("-"),
 }
]
sports_attributes.each do |sport|
  if(Sport.find_by(name: sport[:name]).nil?)
    Sport.create(sport)
  else
    Sport.find_by(name: sport[:name]).update(sport)
  end
end

puts 'Finished updating or creating sports/leagues...'
puts ""
puts ""

puts "Do you want to remove all the teams [DO NOT DO IT]? y-n"
response = STDIN.gets.chomp
if(response.downcase == "y")
  Team.destroy_all
end

puts 'Updating or creating seed teams...'
teams_attributes = [
 {
   name: 'DRAW'
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

teams_attributes.each do |team|
  Team.create(team) if !Team.find_by(name: team[:name])
end

puts 'Finished creating Teams!'


puts "Do you want to reset ALL the events [DO NOT DO IT]? y-n"
response = STDIN.gets.chomp
if(response.downcase == "y")
  Event.destroy_all
end

count = 0
Event.where(unique_event_id: "seed").each do |event|
  event.destroy
  count += 1
end
puts "Removing only seed events...[#{count}]"
puts 'Creating seed events...'

events_attributes = [
 {
   team_a: Team.find_by(name: "Russia"),
   team_b: Team.find_by(name: "France"),
   # # not played yet - winner_id: Optional / Will be created later
   winner: Team.find_by(name: "Russia"),
   event_date: EventDate.find_or_create_by(sport: Sport.find_by(name: "Soccer"),date: "2018-07-16"),
   league: "World Cup 2018",
   status: "Finished",
   # type of this 'date' parameter is DATETIME
   starts_at: '2018-07-09T20:00:00',
   scraped_score: "2-1",
   unique_event_id: "seed"
 },
{
   team_a: Team.find_by(name: "England"),
   team_b: Team.find_by(name: "Argentina"),
   # # not played yet - winner_id: Optional / Game not played yet - false
   winner: Team.tie,
   event_date: EventDate.find_or_create_by(sport: Sport.find_by(name: "Soccer"),date: "2018-07-16"),
   league: "World Cup 2018",
   status: "Finished",
   # type of this 'date' parameter is DATETIME
   starts_at: '2018-07-16T06:00:00',
   scraped_score: "1-1",
   unique_event_id: "seed"
 },
{
   team_a: Team.find_by(name: "Brazil"),
   team_b: Team.find_by(name: "Belgium"),
   # # not played yet - winner_id: Optional / Game not played yet - false
   # winner_id: false,
   event_date: EventDate.find_or_create_by(sport: Sport.find_by(name: "Soccer"),date: "2018-07-16"),
   league: "World Cup 2018",
   status: "In Progress",
   # type of this 'date' parameter is DATETIME
   starts_at: '2018-07-16T12:30:00',
   scraped_score: "-",
   unique_event_id: "seed"

 },
 {
   team_a: Team.find_by(name: "Denmark"),
   team_b: Team.find_by(name: "Sweden"),
   # # not played yet - winner_id: Optional / Game not played yet - false
   # winner_id: false,
   event_date: EventDate.find_or_create_by(sport: Sport.find_by(name: "Soccer"),date: "2018-07-13"),
   league: "World Cup 2018",
   status: "Scheduled",
   # type of this 'date' parameter is DATETIME
   starts_at: '2018-07-16T19:00:00',
   scraped_score: "-",
   unique_event_id: "seed"
 },
 {
   team_a: Team.find_by(name: "Spain"),
   team_b: Team.find_by(name: "Mexico"),
   # # not played yet - winner_id: Optional / Game not played yet - false
   # winner_id: false,
   event_date: EventDate.find_or_create_by(sport: Sport.find_by(name: "Soccer"),date: "2018-07-13"),
   league: "World Cup 2018",
   status: "Scheduled",
   # type of this 'date' parameter is DATETIME
   starts_at: '2018-07-16T21:00:00',
   scraped_score: "-",
   unique_event_id: "seed"
 },
 {
   team_a: Team.find_by(name: "Switzerland"),
   team_b: Team.find_by(name: "Uruguay"),
   # # not played yet - winner_id: Optional / Game not played yet - false
   # winner_id: false,
   event_date: EventDate.find_or_create_by(sport: Sport.find_by(name: "Soccer"),date: "2018-07-13"),
   league: "World Cup 2018",
    status: "Scheduled",
   # type of this 'date' parameter is DATETIME
   starts_at: '2018-07-16T21:00:00',
   scraped_score: "-",
   unique_event_id: "seed"
 },
{
   team_a: Team.find_by(name: "Portugal"),
   team_b: Team.find_by(name: "Croatia"),
   # # not played yet - winner_id: Optional / Game not played yet - false
   # winner_id: false,
   event_date: EventDate.find_or_create_by(sport: Sport.find_by(name: "Soccer"),date: "2018-07-13"),
   league: "World Cup 2018",
    status: "Scheduled",
    # type of this 'date' parameter is DATETIME
   starts_at: '2018-07-16T22:00:00',
   scraped_score: "-",
   unique_event_id: "seed"
 },
{
   team_a: Team.find_by(name: "Japan"),
   team_b: Team.find_by(name: "Colombia"),
   # # not played yet - winner_id: Optional / Game not played yet - false
   # winner_id: false,
   event_date: EventDate.find_or_create_by(sport: Sport.find_by(name: "Soccer"),date: "2018-07-14"),
   league: "World Cup 2018",
    status: "Scheduled",
  # type of this 'date' parameter is DATETIME
   starts_at: '2018-07-17T12:00:00',
   scraped_score: "-",
   unique_event_id: "seed"
 },
]

Event.create!(events_attributes)
puts 'Finished creating seed events!'

