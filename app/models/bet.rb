class Bet < ApplicationRecord
  belongs_to :event
  belongs_to :team, optional: true
  has_many :bet_users
  has_many :users, through: :bet_users
end
