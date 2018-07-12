class GamesData
  attr_reader :live,:results,:schedule

  def initialize(live,results,schedule)
    @live = live
    @results = results
    @schedule = schedule
  end

  #filter by league
  def filter_by_league(leagues)
    leagues.map!(&:downcase)
    return all.flatten.select { |e| leagues.include? e[:league] }
  end
  #filter by teams accept 1 or 2 teams
  def filter_by_team(team1 = "", team2 = "")
    team1.downcase!
    team2.downcase!

    if(team2.empty?)
      return all.flatten.select { |e| e[:team1] == team1 || e[:team2] == team1 }
    else
      return all.flatten.select { |e| ( (e[:team1] == team1 && e[:team2] == team2) || (e[:team1] == team2 && e[:team2] == team1) ) }
    end
  end

  def all
    merged_data = []
    merged_data << @live << @results << @schedule
    return merged_data.flatten.reject { |e| e.nil? }
  end

end
