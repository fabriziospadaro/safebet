class SportsController < ApplicationController
  def index
    @sports = Sport.all
    @parlays = current_user.parlays&.last
  end
end
