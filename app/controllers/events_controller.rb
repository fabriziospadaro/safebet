class EventsController < ApplicationController
  def index
    #TO DO WITHLIST ONLY CERTAIN LEAGUES FOR A SPORT
    sport = Sport.find_by(name: params[:sport])

    @events = Event.today(sport)

    @bets = current_user.bets
  end

end
