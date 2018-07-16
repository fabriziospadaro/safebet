class Sport < ApplicationRecord
  has_many :event_dates

  def leagues
    leagues_string.split("-")
  end

  def today_events
    events = event_dates.find_by(date: DateTime.now.strftime("%Y-%m-%e")).events.where(status: "Scheduled")

    filter_events = events.select do |e|
     (leagues.include?(e.league.downcase) || leagues.include?("all"))
    end
    return filter_events.sort_by {|obj| obj.league}

  end

end
