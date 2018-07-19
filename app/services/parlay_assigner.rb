class ParlayAssigner
  def self.call(user)
    new(user).current_parlay
  end

  def initialize(user)
    @user = user
  end

  def current_parlay
    existing_parlay = @user.parlays.find_by(date: Date.today.in_time_zone("CET"))
    if existing_parlay.nil?
      @user.parlays.build(date: Date.today.in_time_zone("CET"))
      @user.save
      @user.parlays.last
    else
      existing_parlay
    end
  end
end
