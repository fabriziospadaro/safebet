class Event < ApplicationRecord
  belongs_to :team_a, class_name: 'Team', foreign_key: 'team_a_id'
  belongs_to :team_b, class_name: 'Team', foreign_key: 'team_b_id'
  belongs_to :winner, class_name: 'Team', foreign_key: 'winner_id', optional: true
  belongs_to :sport


  def open?
    return (today? || (tomorrow? && before_am?(2)))
  end


  def before_am?(hour)
    return starts_at.hour <= hour
  end

  def today?
    today = DateTime.now
    return (starts_at.day == today.day && starts_at.month == today.month)
  end

  def tomorrow?
    tomorrow = DateTime.tomorrow
    return (starts_at.day == tomorrow.day && starts_at.month == tomorrow.month)
  end

  def self.today(sport)
    events = []
    Event.where(sport: sport, status: "Scheduled").each do |event|
      events << event if event.open?
    end
    filter_leagues = sport.leagues.map(&:downcase)

    filter_events = events.select do |e|
      (filter_leagues.include?(e.league.downcase) || filter_leagues.include?("all"))
    end
    return filter_events.sort_by {|obj| obj.league}
  end

end
