class EventsController < ApplicationController
  def index
    #TO DO WITHLIST ONLY CERTAIN LEAGUES FOR A SPORT
    @sport = Sport.find_by(name: params[:sport])

    @events = @sport.today_events

    @bets = current_user.bets
    @parlays = current_user.parlays&.last
  end

end
