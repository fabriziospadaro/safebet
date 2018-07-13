class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def test

  end

  def profile
     @parlays = current_user.parlays

    @wins = []
    current_user.parlays.each do |parlay|
      if parlay.prize > 0
        @wins << parlay
      end
    end
  end
end
