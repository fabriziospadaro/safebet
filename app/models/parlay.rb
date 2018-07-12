class Parlay < ApplicationRecord
  belongs_to :user
  has_many :bet_users
  has_many :bets, through: :bet_users, dependent: :destroy

  def correct?
    bets.all? { |bet| bet.correct? } && (DateTime.now.strftime('%Y-%m-%d') == date.strftime('%Y-%m-%d'))
  end
end
