task :check_shopstyle => :environment do
  Shopstyle.checking
  # puts "done."
end

# task :send_reminders => :environment do
#   User.send_reminders
# end

