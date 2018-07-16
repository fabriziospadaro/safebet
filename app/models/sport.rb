class Sport < ApplicationRecord
  has_many :event_dates

  def leagues
    leagues_string.split("-")
  end

  def today_events
    event_dates.find_by(date: DateTime.now.strftime("%Y-%m-%e")).events.where(status: "Scheduled")
  end

  def events_by_date(date)
    event_dates.find_by(date: date.strftime("%Y-%m-%e")).events.where(status: "Finished")
  end
end
