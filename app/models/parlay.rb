class Parlay < ApplicationRecord
  belongs_to :user
  has_many :bet_users
  has_many :bets, through: :bet_users
end
