# ===== # Creating Sports  ====
#deleting A SPORT WILL REMOVE ALL THE EVENTS ASSOCIATED WITH HIM VERY DANGEROUS
puts 'Updating or creating sports/leagues...'
SoccerLeague = [
"World Cup 2018",
"UEFA Europa League Qualifying",
"all",
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
EventDate.destroy_all
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
   winner: Team.find_by(name: "TIE"),
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
   starts_at: '2018-07-13T19:00:00',
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
   starts_at: '2018-07-13T21:00:00',
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
   starts_at: '2018-07-13T21:00:00',
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
   starts_at: '2018-07-13T22:00:00',
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
   starts_at: '2018-07-14T12:00:00',
   scraped_score: "-",
   unique_event_id: "seed"
 },
]

Event.create!(events_attributes)
puts 'Finished creating seed events!'


# ==== REFERENCE === Schema as of 12-30pm, 12 July 2018 ===

# create_table "events", force: :cascade do |t|
#     t.integer "odds". - OPTIONAL, NOT USING
#     t.integer "team_a_id" - USING
#     t.integer "team_b_id" - USING
#     t.integer "winner_id" - ONLY FOR THE GAMES FINISHED
#     t.bigint "sport_id" - USING
#     t.datetime "created_at", null: false
#     t.datetime "updated_at", null: false
#     t.string "league" - USING
#     t.string "status" - USING
#     t.string "unique_event_id" - OPTIONAL, NOT USING
#     t.string "scraped_score" - USING
#     t.integer "team_a_score" - NOT USING FOR NOW
#     t.integer "team_b_score" - NOT USING FOR NOW
#     t.datetime "starts_at" - USING
#     t.index ["sport_id"], name: "index_events_on_sport_id"
