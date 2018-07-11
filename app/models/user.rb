class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bet_users
  has_many :bets, through: :bet_users
  has_many :parlays

  def today_bet
    my_bet = []
    date = Time.now.to_s.split(" ")[0].split("-")
    date = date[1] + "/" + date[2]

    bets.each do |bet|
      my_bet << bet if (bet.event.date == date)
    end

    return my_bet
  end

  def first_bet_for_event?(event_id)
    bets.find_by(event: Event.find(event_id)).nil?
  end
end
