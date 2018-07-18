class BetUser < ApplicationRecord
  belongs_to :parlay, optional: true
  belongs_to :bet, dependent: :destroy
  belongs_to :user
end
