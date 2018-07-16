class BetsController < ApplicationController
  before_action :set_references

  def create
    @event = Event.find(params[:event])
    current_user.bets.build(
      team: Team.find(params[:winner]),
      event: @event
    )
   current_user.save
   @bet = current_user.bets.last
   current_user.bet_users.last.update(parlay: ParlayAssigner.call(current_user))
  end

  def update
    @bet = Bet.find(params[:id])
    @bet.update(team: Team.find(params[:winner]))
    render "update.js.erb"
  end

  def destroy
    @bet = Bet.find(params[:id])
    current_user.bet_users.find_by(bet: @bet).destroy
    render "update.js.erb"
  end

  private

  def set_references
    @tie = Team.tie
    @sport = Sport.find_by(name: params[:sport])
  end

end

 #  #not nil take team TIE
 #  def update_bet
 #    if(!params[:destroy].nil?)
 #      destroy_bet
 #      redirect_to slip_path
 #    elsif current_user.first_bet_for_event?(params[:event])
 #      create_bet
 #      redirect_to events_path(sport: params[:sport],anchor: params[:event])
 #    else
 #      change_bet
 #      redirect_to events_path(sport: params[:sport],anchor: params[:event])
 #    end
 #  end

 #  def destroy_bet
 #    mybet = current_user.today_bets.find_by(event: Event.find(params[:event]))
 #    current_user.bet_users.find_by(bet: mybet).destroy
 #  end


 #  def create_bet
 #   current_user.bets.build(
 #    team: Team.find(params[:winner]),
 #    event: Event.find(params[:event])
 #    )
 #   current_user.save
 #   current_user.bet_users.last.update(parlay: ParlayAssigner.call(current_user))
 # end

 #  def change_bet

 #    mybet = current_user.today_bets.find_by(event: Event.find(params[:event]))

 #    if(Team.find(params[:winner]) != mybet.team)
 #      mybet.update(team: Team.find(params[:winner]))
 #    else
 #      destroy_bet
 #    end

 #  end

