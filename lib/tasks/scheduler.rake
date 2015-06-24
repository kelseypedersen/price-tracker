task :check_shopstyle => :environment do
  # include Shopstyle

  Want.checking
  Want.notification

  # Shopstyle.notification
  # puts "done."
end

# task :send_reminders => :environment do
#   User.send_reminders
# end

# run rake check_shopstyle

