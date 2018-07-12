class FakeScheduleUpdaterJob < ApplicationJob
  queue_as :default
  #cron
  def perform()
    while true
      UpdateEventsJob.perform_later
      sleep(3.minutes)
    end
  end
end
