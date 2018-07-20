namespace :demo do
  desc "Fake results for all games in parlay during demo"

  task :fake_results => :environment do
    parlay = Parlay.last
    ResultFaker.call(parlay, false)
  end

  task :fake_win => :environment do
    parlay = Parlay.last
    ResultFaker.call(parlay, true)
  end
end
