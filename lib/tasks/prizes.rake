namespace :prizes do
  desc "Distributes payouts among winning parlays"
  task :distribute, [:prize] => :environment do |t, args|
    ExtractWinningParlayJob.perform_later(args[:prize])
  end
end
