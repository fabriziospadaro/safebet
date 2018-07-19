class SportsController < ApplicationController
  def index
    @sports = Sport.all.order(:id)
    @parlays = Parlay.current(current_user)
    @error = params[:error] if (params[:error])
  end
end
