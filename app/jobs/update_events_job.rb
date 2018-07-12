class UpdateEventsJob < ApplicationJob
  queue_as :default

  #da creare il job che aggiorna tutti gli event isenza fottersene
  def perform(option)
    ##add migration to sport to store an array of league


    puts "------------------------------------------"
    puts "Starting Job for #{option[:sport]}"
    puts "---Starting scrape---"
    results = SportScraper.scrape_day(option).filter_by_league(Sport.find_by(name: option[:sport]).leagues.split("-"))

    puts "---  Scrape done  ---"
    results.each do |a|
      event = Event.find_by(unique_event_id: a[:unique_id])
      #create an event when it's not there
      if(event.nil?)
        puts "+ Created: #{a[:unique_id]}"
        team1 = Team.find_or_create_by(name: a[:team1])
        team2 = Team.find_or_create_by(name: a[:team2])
        hash_ = {team_a: team1, team_b: team2, sport: Sport.find_by(name: a[:sport]), league: a[:league], status: a[:status],unique_event_id: a[:unique_id],starts_at: a[:date]}
        if(!a[:score].nil?)
          hash_[:scraped_score] = a[:score]
        end
        if(!a[:winner].nil?)
          hash_[:winner] = Team.find_by(name: a[:winner])
        end
        if(!a[:time].nil?)
          hash_[:time] = a[:time]
        end
        Event.create(hash_)
      #already there: just update: score? winner? time? status?
      else
        puts "/ Updated: #{a[:unique_id]}"
        event.update(scraped_score: a[:score], winner: Team.find_by(name: a[:winner]), time: a[:time], status: a[:status])
      end

    end
    puts ""
    puts ""
    puts "Job done for #{option[:sport]} PEACE"
  end
end
