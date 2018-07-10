class Bet < ApplicationRecord
  belongs_to :event
  belongs_to :team
  has_many :bet_users
  has_many :users, through: :bet_users
  validates :event, uniqueness: { scope: :users }

  #delegate :unique_event_id, to: :event
end
