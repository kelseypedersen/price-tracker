require 'rubygems'
require 'twilio-ruby'

class Want < ActiveRecord::Base

  belongs_to :user
  has_many :products

  # extend self

  def self.checking
    puts "Checking shopstyle from model!"

    # Loop through the list of wants
    wants = Want.all
    wants.each do |want|
       # For each want, call the api for the specific product - HTTParty.get(API URL)
      client = HTTParty.get("http://api.shopstyle.com/api/v2/products/#{want.product_id}?pid=uid5001-30368749-95")
      # create variable to store current price on shopstyle
      # Find the current Shopstyle API price for the product
      currentShopstylePrice = client["priceLabel"]
      if (currentShopstylePrice == "Sold Out")
      elsif (currentShopstylePrice.to_i <= want.max_price)
        want.fulfilled = true
        # Call the notification method here so that there is less logic in the notification method
        notification
      # Do we want logic here for the price going back higher again?
      else (currentShopstylePrice.to_i > want.max_price)
        want.fulfilled = false
      end
    end
  end


  # Checking the shopstyle API

  ### Loop through the list of wants
  ### For each want, call the api for the specific product
  ### HTTParty.get(API URL)
  # Find the current Shopstyle API price for the product
  # If the current Shopstyle price is less than the max_price for the want
  # then update the want below_max to true

########################################

  # Loop through the list of wants
  # If the below_max is true && notified is false
  # then send push notification to the user


  def self.notification
    puts "Sending notification"

    wants = Want.all
    wants.each do |want|
    p want.notified

      # userId = want.user_id
      # user = User.find(userId)
      # user_phone = user.phone_number
      user_phone = "+16507995844"

      if want.notified == false
        # next if !want.fulfilled || want.notified
        # next unless want.fulfilled && !want.notified
        account_sid = ENV["ACCOUNT_SID"]
        auth_token = ENV["AUTH_TOKEN"]
        client = Twilio::REST::Client.new account_sid, auth_token

        from = ENV['TWILIO_NUMBER'] # Your Twilio number

          client.account.messages.create(
            :from => from,
            :to => user_phone,
            :body => "Hey #{user.name}, the #{want.product_name} meets your ideal price!"
          )
          puts "Sent message to #{user_phone}"
          want.notified = true
      end
    end
  end
end
