class EventsController < ApplicationController
  def index
    #TO DO WITHLIST ONLY CERTAIN LEAGUES FOR A SPORT
    @events = []
    Event.where(sport: Sport.find_by(name: params[:sport]), status: "Scheduled").each do |event|
      @events << event if event.open?
    end
    @events.sort_by {|obj| obj.league}
    @bets = current_user.bets
  end

end
