class EventsController < ApplicationController
  def index
    @events = Event.where(sport: Sport.find_by(name: params[:sport])).sort_by{ |e| e.league }
    @bets = current_user.bets
  end

end
