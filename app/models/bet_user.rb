class BetUser < ApplicationRecord
  belongs_to :parlay, optional: true
  belongs_to :bet, dependent: :destroy
  belongs_to :user

  before_save :assign_parlay

  private

  def assign_parlay
    # Interesting stuff here
  end
end
