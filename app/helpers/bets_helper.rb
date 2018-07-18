module BetsHelper
  def generate_bet_link(event, team, bet)
    if current_user.first_bet_for_event?(event)
      create_link(event, team)
    else
      if team != bet.team
        update_or_destroy_link(event, team, bet, :patch)
      else
        update_or_destroy_link(event, team, bet, :delete)
      end
    end
  end

  private

  def create_link(event, team)
    link_to team.name.titleize,
              bets_path(
                event: event,
                winner: team,
                sport: params["sport"]
              ),
              method: :post,
              remote: true,
              data: { disable_with: "Saving bet..." },
              class: ("bet-default")
  end

  def update_or_destroy_link(event, team, bet, verb)
    link_to team.name.titleize,
              bet_path(
                bet,
                event: event,
                winner: team,
                sport: params["sport"]
              ),
              method: verb,
              remote: true,
              data: { disable_with: "Updating bet..." },
              class: (
                !bet.nil? && !bet.team.nil? && bet.team == team ? "bet-active" : "bet-default"
              )
  end
end
