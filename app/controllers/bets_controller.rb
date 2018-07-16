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

  def destroy_from_betslip
    @bet = Bet.find(params[:id])
    current_user.bet_users.find_by(bet: @bet).destroy
    redirect_to slip_path
  end

  private

  def set_references
    @tie = Team.tie
    @sport = Sport.find_by(name: params[:sport])
  end

end
