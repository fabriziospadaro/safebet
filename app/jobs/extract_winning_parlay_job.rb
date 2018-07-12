class ExtractWinningParlayJob < ApplicationJob
  queue_as :default

  def perform(win_pot)
    winning_parlays = []

    User.all.each do |user|
      winning_parlays << user.parlays.last if user.parlays.last.correct?
    end

    longest = 0
    winning_parlays.each do |parlay|
      if(longest < parlay.bets.size)
        longest = parlay.bets.size
      end
    end

    winning_parlays = winning_parlays.select { |parlay| parlays.size == longest}

    winning_parlays.each do |parlay|
      parlay.prize = win_pot / winners.size
    end
  end
end
