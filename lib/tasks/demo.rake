namespace :demo do
  desc "Fake results for all games in parlay during demo"

  task :fake_results, [:id] => :environment do |t, args|
    parlay = Parlay.current(User.find(args[:id].to_i))
    ResultFaker.call(parlay, false)
  end

  task :fake_win, [:id] => :environment do |t, args|
    parlay = Parlay.current(User.find(args[:id].to_i))
    ResultFaker.call(parlay, true)
  end
end
