desc "This task is called by the Heroku scheduler add-on"
task :check_shopstyle => :environment do
  puts "Checking shopstyle..."
  # NewsFeed.update
  # puts "done."
end

# task :send_reminders => :environment do
#   User.send_reminders
# end