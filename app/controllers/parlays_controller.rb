class ParlaysController < ApplicationController
  def index
    @parlays = current_user.parlays

    @wins = []
    current_user.parlays.each do |parlay|
      if parlay.prize > 0
        @wins << parlay
      end
    end
  end

  def show
    @parlay = current_user.parlays.find(params[:id])

    @wins = []
    current_user.parlays.each do |parlay|
      if parlay.prize > 0
        @wins << parlay
      end
    end


  end

end


