namespace :demo do
  desc "Fake results for all games in parlay during demo"
  task fake_results: :environment do
    parlay = Parlay.last
    ResultFaker.call(parlay)
  end
end
