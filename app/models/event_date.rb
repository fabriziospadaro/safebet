class EventDate < ApplicationRecord
  belongs_to :sport
  has_many :events, dependent: :destroy
end
