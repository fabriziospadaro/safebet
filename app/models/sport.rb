class Sport < ApplicationRecord
  has_many :events
  def leagues
    leagues_string.split("-")
  end
end
