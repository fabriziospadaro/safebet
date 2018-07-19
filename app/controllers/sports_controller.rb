class SportsController < ApplicationController
  def index
    @sports = Sport.all.order(:id)
    @parlays = current_user.parlays&.last
    @error = params[:error] if (params[:error])
  end
end
