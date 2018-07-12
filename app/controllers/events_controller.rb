class EventsController < ApplicationController
  def index
    #TO DO WITHLIST ONLY CERTAIN LEAGUES FOR A SPORT
    @events = Event.where(sport: Sport.find_by(name: params[:sport]), status: "Scheduled")
    @bets = current_user.bets
  end

end
