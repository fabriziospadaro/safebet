class UpdateEventsJob < ApplicationJob
  queue_as :default

  #da creare il job che aggiorna tutti gli event isenza fottersene
  def perform(option)
    ##add migration to sport to store an array of league


    puts "------------------------------------------"
    puts "Starting Job for #{option[:sport]}"
    puts "---Starting scrape---"
    results = SportScraper.scrape_day(option)

    puts "---  Scrape done  ---"
    aa = 0
    b = 0
    c = 0
    results.all.each do |a|
      event = Event.find_by(unique_event_id: a[:unique_id])
      #create an event when it's not there
      if(event.nil?)
        b += 1
        puts "+ Created: #{a[:unique_id]}"
        team1 = Team.find_or_create_by(name: a[:team1])
        team2 = Team.find_or_create_by(name: a[:team2])
        hash_ = {team_a: team1, team_b: team2, league: a[:league], status: a[:status],unique_event_id: a[:unique_id],starts_at: a[:date]}
        hash_[:event_date] = EventDate.find_or_create_by(sport: Sport.find_by(name: a[:sport]), date: hash_[:starts_at].strftime("%Y-%m-%e"))
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
        c += 1
        puts "/ Updated: #{a[:unique_id]}"
        prev_state = event.status
        event.update(scraped_score: a[:score], winner: Team.find_by(name: a[:winner]), time: a[:time], status: a[:status])
        if(prev_state == "Finished")
          event.update(status: "Finished")
        end
      end
        aa += 1
    end
    puts "OVER #{aa} Events: #{b} Created and #{c} Updated"
    puts ""
    puts "Job done for #{option[:sport]} PEACE"
  end
end
