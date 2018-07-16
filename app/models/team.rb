class Team < ApplicationRecord
  has_many :events

  def self.tie
    self.find_by(name: "TIE")
  end
end
