class ResultFaker
  def self.call(parlay,impose_win)
    if(impose_win)
      new(parlay).fake_win
    else
      new(parlay).fake_results
    end
  end

  def initialize(parlay)
    @parlay = parlay
  end

  def fake_results
    @parlay&.bets.find_each do |b|
      assign_winner_and_score(b.event)
    end
  end

  def fake_win
    @parlay&.bets.find_each do |b|
      fake_event_sucess(b)
    end
  end

  private

  def generate_score_for_sport(sport)
    case sport.name.downcase
    when "soccer"
      return rand(0..4)
    when "basketball"
      return rand(50..110)
    when "tennis"
      return rand(2..3)
    when "baseball"
      return rand(1..10)
    end
  end

  def fake_event_sucess(bet)
    event = bet.event
    sport = event.event_date.sport
    team_a = event.team_a
    team_b = event.team_b
    tie = Team.find_by(name: "DRAW")

    score_a = generate_score_for_sport(sport)
    score_b = generate_score_for_sport(sport)

    if(sport.name.downcase != "soccer")
      while score_a == score_b do
        score_a = generate_score_for_sport(sport)
        score_b = generate_score_for_sport(sport)
      end
    end

    score_a = score_b + 1 if(team_a == bet.team && score_a <= score_b)

    score_b = score_a + 1 if(team_b == bet.team && score_b <= score_a)

    if(bet.team == tie )
        score_a = score_b
    end

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


  def assign_winner_and_score(event)
    score_a = generate_score_for_sport(event.event_date.sport)
    score_b = generate_score_for_sport(event.event_date.sport)

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
