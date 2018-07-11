class EventsController < ApplicationController
  def index
    @events = Event.where(sport: Sport.find_by(name: params[:sport]), status: "Scheduled")
    @bets = current_user.bets
  end

end
