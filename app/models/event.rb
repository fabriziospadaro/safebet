class Event < ApplicationRecord
  belongs_to :team_a, class_name: 'Team', foreign_key: 'team_a_id'
  belongs_to :team_b, class_name: 'Team', foreign_key: 'team_b_id'
  belongs_to :winner, class_name: 'Team', foreign_key: 'winner_id', optional: true
  belongs_to :event_date

  def cet_date
    starts_at.in_time_zone("CET")
  end

  def started?
    now = DateTime.now.in_time_zone("CET")
    return cet_date < now
  end

end
