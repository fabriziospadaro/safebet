class Sport < ApplicationRecord
  has_many :event_dates

  def leagues
    leagues_string.split("-").map(&:downcase)
  end

  def self.todays_leagues(events)
    leagues_paying = []

    events.each do |event|
      leagues_paying << event.league if (!leagues_paying.include?(event.league))
    end
    return leagues_paying
  end
  def today_events
    events = event_dates.find_by(date: DateTime.now.strftime("%Y-%m-%e")).events.where(status: "Scheduled")

    # filter_events = events.select do |e|
    #   (leagues.include?(e.league.downcase) || leagues.include?("all"))
    # end

    filter_events = events.where(league: leagues)

    return filter_events.order(:league)
    #sort_by {|obj| obj.league}

  end

end
