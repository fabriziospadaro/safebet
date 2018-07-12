class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bet_users, dependent: :destroy
  has_many :bets, through: :bet_users, dependent: :destroy
  has_many :parlays

  def today_bets
    parlays&.last&.bets
  end

  def first_bet_for_event?(event_id)
    bets.find_by(event: Event.find(event_id)).nil?
  end
end
