class EventsController < ApplicationController
  def index
    #TO DO WITHLIST ONLY CERTAIN LEAGUES FOR A SPORT
    if(params[:league])
      redirect_to events_path(sport: params[:sport],anchor: params[:league])
    end

    @sport = Sport.find_by(name: params[:sport].capitalize)

    @events = @sport.today_events&.includes(:team_a, :team_b)&.reverse

    if(@events&.size.to_i == 0)
      redirect_to sport_path(error: "There are no #{@sport.name} events scheduled for today")
    else
      @leagues_playing = Sport.todays_leagues(@events)
      @bets = current_user.bets
      @parlay = current_user.parlays&.last
      @tie = Team.tie
    end

  end

end
