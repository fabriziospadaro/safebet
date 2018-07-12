class BetsController < ApplicationController
  #not nil take team TIE
  def update_bet
    if(!params[:destroy].nil?)
      destroy_bet
      redirect_to slip_path
    elsif current_user.first_bet_for_event?(params[:event])
      create_bet
      redirect_to events_path(sport: params[:sport],anchor: params[:event])
    else
      change_bet
      redirect_to events_path(sport: params[:sport],anchor: params[:event])
    end
  end

  def destroy_bet
    mybet = current_user.today_bets.find_by(event: Event.find(params[:event]))
    current_user.bet_users.find_by(bet: mybet).destroy
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

    mybet = current_user.today_bets.find_by(event: Event.find(params[:event]))

    if(Team.find(params[:winner]) != mybet.team)
      mybet.update(team: Team.find(params[:winner]))
    else
      destroy_bet
    end

  end

end
