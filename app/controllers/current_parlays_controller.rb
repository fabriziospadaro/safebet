class CurrentParlaysController < ApplicationController
  def show
    @bets = current_user.parlays.last.bets&.sort_by{ |b| b.event.starts_at }
  end
end
