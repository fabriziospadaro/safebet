class ParlaysController < ApplicationController

  def index
    @parlays = current_user.parlays
    @parlays = @parlays.order(date: :desc)
    @wins = get_wins
  end

  def show
    @parlay = current_user.parlays.find(params[:id])
    @wins = get_wins
  end


  def get_wins
    @wins = []
    current_user.parlays.each do |parlay|
      if parlay.prize > 0
        @wins << parlay
      end
    end
    return @wins
  end

end


