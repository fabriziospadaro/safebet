class BetsController < ApplicationController

  def update_bet
    if(current_user.bets.where(event: Event.find(params[:event])).size == 0)
      current_user.bets.build(team: Team.find(params[:winner]), event: Event.find(params[:event]))
      current_user.save
    else
      mybet = current_user.bets.where(event: Event.find(params[:event]))[0]
      if(!params[:winner].nil?)
        mybet.update(team: Team.find(params[:winner]))
      else
        mybet.update(team: nil)
      end
    end
    # redirect_back fallback_location:{ action: "index", anchor: params[:event] }
    redirect_to events_path(sport: params[:sport],anchor: params[:event])
  end


  def destroy

  end
end
