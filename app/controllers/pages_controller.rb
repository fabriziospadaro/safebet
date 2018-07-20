class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def profile
    @parlays = current_user.parlays
    @total_prize_won = 0
    @total_wins = 0

    @parlays&.each do |p|
      @total_prize_won += p.prize
      @total_wins += 1 if p.prize > 0
    end

  end
end
