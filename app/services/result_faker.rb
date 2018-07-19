class ResultFaker
  def self.call(parlay)
    new(parlay).fake_results
  end

  def initialize(parlay)
    @parlay = parlay
  end

  def fake_results
    @parlay&.bets.find_each do |b|
      assign_winner_and_score(b.event)
    end
  end

  private

  def assign_winner_and_score(event)
    score_a = rand(0..5)
    score_b = rand(0..5)

    team_a = event.team_a
    team_b = event.team_b
    tie = Team.find_by(name: "DRAW")

    # Black magic!
    winner = (score_a > score_b) ? team_a : team_b
    winner = (score_a == score_b) ? tie : winner

    event.update(
      scraped_score: "#{score_a}-#{score_b}",
      winner: winner,
      status: "Finished",
      team_a_score: score_a,
      team_b_score: score_b
    )
  end
end
