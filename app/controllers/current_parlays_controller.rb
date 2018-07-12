class CurrentParlaysController < ApplicationController
  def show
    @parlay = current_user.parlays.last
  end
end
