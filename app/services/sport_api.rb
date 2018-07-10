require 'net/http'
require 'active_support/core_ext/hash'

class SportApi
  def self.games_infos(sport)
    url = "https://www.scorespro.com/rss2/live-#{sport}.xml"
    response = Net::HTTP.get_response(URI.parse(url)).body
    xml_hash = Hash.from_xml(response)
    data = []

    xml_hash["rss"]["channel"]["item"].each do |dunno|
      if(sport == "soccer")
        info = dunno["description"].split(" ")
        hash_info = {league: info[0].tr('()', ''), start_date: dunno["pubDate"]}
        start = 1
      else
        info = dunno["title"].split(" ")
        hash_info = {league: info[3].tr('()', ''), start_date: dunno["pubDate"], score: info.last}
        hash_info[:status] = dunno["description"]
        start = 4
      end

      end_1 = 0
      team1 = ""
      team2 = ""
      for i in start..1000
         if(info[i] == "vs")
          end1 = i+1
          break
        else
          team1 += info[i].tr('#', '') + " "
        end
      end
      for i in end1..1000
        if(info[i][info[i].size-1] == ":")
          end1 = i
          team2 += info[i].tr(':', '')
          break
        else
          team2 += info[i].tr('#', '') + " "
        end
      end

      if(sport == "soccer")
        hash_info[:score] = info[end1+1]
        status = ""
        for i in (end1+3)..info.size
          status += info[i] + " " if(!info[i].nil?)
        end

        hash_info[:status] = status.strip
      end
      hash_info[:team1] = team1.strip.tr('#','')
      hash_info[:team2] = team2.strip.tr('#','')
      if(hash_info[:status] == "Match Finished")
        if(hash_info[:score].split("-")[0].to_i > hash_info[:score].split("-")[1].to_i)
          hash_info[:winner] = hash_info[:team1]
        elsif hash_info[:score].split("-")[0].to_i == hash_info[:score].split("-")[1].to_i
          hash_info[:winner] = "tie"
        else
          hash_info[:winner] = hash_info[:team2]
        end
      else
        hash_info[:winner] = ""
      end
        hash_info[:unique_event_id] = hash_info[:team1][0]+hash_info[:team1][1]+hash_info[:league][0] + hash_info[:league][0] + hash_info[:start_date]
      data << hash_info
    end
    return data
  end
end
