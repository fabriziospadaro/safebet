class BetsController < ApplicationController
  #not nil take team TIE
  def update_bet
    if current_user.first_bet_for_event?(params[:event])
      create_bet
    else
      change_bet
    end
    # redirect_back fallback_location:{ action: "index", anchor: params[:event] }
    redirect_to events_path(sport: params[:sport],anchor: params[:event])
  end

  def destroy

  end

  private

  def create_bet
   current_user.bets.build(
    team: Team.find(params[:winner]),
    event: Event.find(params[:event])
    )
   current_user.save
   current_user.bet_users.last.update(parlay: ParlayAssigner.call(current_user))
 end

 def change_bet
  mybet = current_user.bets.where(event: Event.find(params[:event])).first

  if(!params[:winner].nil?)
    if(mybet.team.nil? || mybet.team != Team.find(params[:winner]))
      mybet.update(team: Team.find(params[:winner]))
    else
      mybet.destroy()
    end
  else
    mybet.update(team: nil)
  end
end

end
