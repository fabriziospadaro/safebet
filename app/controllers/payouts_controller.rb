class PayoutsController < ApplicationController
  def index
    @parlays = current_user.parlays
    #to get date of parlay  parlay.date
    #if parlay.prize > 0 display "Win" parlay.prize
  end

  def show
  end
end
