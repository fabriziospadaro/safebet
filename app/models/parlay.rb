class Parlay < ApplicationRecord
  belongs_to :user
  has_many :bet_users
  has_many :bets, through: :bet_users, dependent: :destroy

  def correct?
    (bets.all? { |bet| bet.correct? } && today)
  end

  def today?
    date == Date.today.in_time_zone("CET")
  end

  def self.current(new_user)
    new_user.parlays.find_by(date: Date.today.in_time_zone("CET"))
  end
end
