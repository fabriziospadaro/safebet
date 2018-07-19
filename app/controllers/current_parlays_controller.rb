class CurrentParlaysController < ApplicationController
  def show
    @bets = Parlay.current(current_user).bets&.sort_by{ |b| b.event.starts_at }
  end
end
