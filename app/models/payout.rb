class Payout < ApplicationRecord
  has_many :users
  has_many :parlays
  monetize :price_cents
end
