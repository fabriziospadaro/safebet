class ExtractWinningParlayJob < ApplicationJob
  queue_as :default

  def perform(win_pot)
    parlays = []
    User.all.each do |user|
      parlays << user.parlays.last if user.parlays.last.correct?
    end
    parlays.each do |parlay|
      parlay.prize = win_pot / winners.size
    end
  end
end
