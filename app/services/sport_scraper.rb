require 'nokogiri'
require 'open-uri'

class SportScraper

  #scrape an entire day of that sport returning: live,schedule and results for the seleted sport
  def self.scrape_day(params)
    #convert to scrape parameter format
    if(!params[:date].nil?)
      params[:results] = true
      params[:date] = params[:date].to_s.split(" ")[0]
    end

    live = scrape_live(params[:sport]) if(!params[:live].nil?)
    results = scrape_results(params[:sport],params[:date]) if(!params[:results].nil?)
    schedule = scrape_schedule(params[:sport]) if(!params[:schedule].nil?)

    return GamesData.new( live, results, schedule)
  end
  private
  #scrape schedules for the current day
  def self.scrape_schedule(sport)
    array = []
    date = Time.now.to_s.split(" ")[0].split("-")

    date = date[1] + "/" + date[2]
    for i in 1..99999
      url = "https://betsapi.com/cs/#{sport}/p.#{i}"
      r = Nokogiri::HTML(open(url))
      table = r.at('table')
      if(!table.search('tr')[0].nil?)
        table.search('tr').each do |tr|
          better_info = tr.text.split("\n").map { |e| e.strip }.reject { |e| e.empty? }
          teams = better_info[2].split("v")
          #show only schedule for today
          if(date == better_info[1].split(" ")[0])
            _hash = {sport: sport,league: better_info[0].downcase,date: better_info[1],team1: teams[0].strip.downcase,team2: teams[1].strip.downcase,status: "Scheduled"}
            _hash[:unique_id] = _hash[:league] + _hash[:team1] + _hash[:team2] + _hash[:date].to_s.split(" ")[0]
            array << _hash
          end
        end
      else
        break
      end
    end
    return array
  end

  #scrape results of the finishes games for the current day
  def self.scrape_results(sport,date)
    array = []

    for i in 1..99999
      if(date.nil?)
        url = "https://betsapi.com/ce/#{sport}/p.#{i}"
      else
        url = "https://betsapi.com/cs/#{sport}/#{date}/p.#{i}"
      end
      r = Nokogiri::HTML(open(url))
      table = r.at('table')
      if(!table.search('tr')[0].nil?)
        table.search('tr').each do |tr|
          better_info = tr.text.split("\n").map { |e| e.strip }.reject { |e| e.empty? }
          teams = better_info[2].split("v")
          _hash = {sport: sport,league: better_info[0].downcase,date: better_info[1],team1: teams[0].strip.downcase,team2: teams[1].strip.downcase}
          #separate with comma CHECK IT
          score = better_info.last.gsub(",","-")
          score = score.split("-")
          if(score.size > 1)
            if(score[-2].to_i == score[-1].to_i)
              winner = "TIE"
            else
              winner = score[-2].to_i > score[-1].to_i ? _hash[:team1] : _hash[:team2]
            end
            _hash[:status] = "Fineshed"
            _hash[:score] = better_info.last
            _hash[:winner] = winner
          else
            _hash[:status] = "ERROR"
          end
          _hash[:unique_id] = _hash[:league] + _hash[:team1] + _hash[:team2] + _hash[:date].to_s.split(" ")[0]
          array << _hash
        end
      else
        break
      end
    end
    return array
  end

  #scrape live score for the game in progress
  #a volte il porco di dio mi mette una roba tra parentesi quadre
  def self.scrape_live(sport)
    array = []
    url = "https://betsapi.com/ci/#{sport}/"
    r = Nokogiri::HTML(open(url))
    table = r.at('table')
    table.search('tr').each do |tr|
      better_info = tr.text.split("\n").map { |e| e.strip }.reject { |e| e.empty? }
      team1 = better_info[2].split("v")[0]
      team2 = better_info[4].split("v")[0]
      if(team1[0] == "[")
        team1 = team1.split
        team1.shift
        team1 = team1.join(" ")
      end
      if(team2[0] == "[")
        team2 = team2.split
        team2.shift
        team2 = team2.join(" ")
      end
      date = Time.now.to_s.split(" ")[0].split("-")
      date = date[1] + "/" + date[2]
      _hash = {sport: sport,league: better_info[0].downcase,time: better_info[1],team1: team1.strip.downcase,team2: team2.strip.downcase,score: better_info[3],status:  "In Progress",date: date}
      _hash[:unique_id] = _hash[:league] + _hash[:team1] + _hash[:team2] + _hash[:date]
      array << _hash
    end
    return array

  end

end
