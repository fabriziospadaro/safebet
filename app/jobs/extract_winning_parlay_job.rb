class ExtractWinningParlayJob < ApplicationJob
  queue_as :default

  def perform(win_pot)
    winning_parlays = []

    User.all.each do |user|
      winning_parlays <<  Parlay.current(user) if Parlay.current(user)&.correct?
    end

    longest = 0
    winning_parlays.each do |parlay|
      longest = parlay.size if(parlay.size > longest)
    end

    winning_parlays = winning_parlays.select { |parlay| parlay.size == longest}

    winning_parlays.each do |parlay|
      Parlay.find(parlay.id).update(prize: (win_pot / winning_parlays.size))

    end
  end
end
