namespace :event do
  desc "Update all the events"
  task update_events: :environment do
    Sport.all.each do |sport|
      UpdateEventsJob.perform_later(sport: sport.name,live: true, schedule: true, results: true)
      puts "Loaded all the events for: #{sport.name}"
    end
  end

end
