class BetsController < ApplicationController

  def create
    current_user.bets.build(team: Team.find(params[:winner]), event: Event.find(params[:event]))
    current_user.save
    redirect_back fallback_location:{ action: "show", id: 5 }
  end

  def update

  end

  def edit

  end

  def destroy

  end
end
