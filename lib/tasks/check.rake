namespace :check do
  desc "Check all Pages for updates; send notifications for changes"
  task all: :environment do

    PollPage.perform_all

    # look for new changes
    Change.check
  end

  desc "Do check:all, but on a 10 minute loop (hacky substitute for cron)"
  task loop: :environment do
    loop do
      Pollpage.perform_all
      Change.check
      sleep(10.minutes)
    end
  end
end
