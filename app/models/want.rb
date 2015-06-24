require 'rubygems'
require 'twilio-ruby'

class Want < ActiveRecord::Base

  belongs_to :user
  has_many :products

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
        p "this item is sold out"
      elsif (currentShopstylePrice.to_i < want.max_price)
        p "BUY BUY BUY"
        want.fulfilled = true
        p "Fulfilled by checking method"
      # Do we want logic here for the price going back higher again?
      elsif (currentShopstylePrice.to_i > want.max_price)
        p "Switched from BUY to do NOT buy!"
        want.fulfilled = false
        p "No longer fulfilled"
      else
        p "were working on it"
      end

      p "Product id: " + want.product_id.to_s
      p "Max price: " + want.max_price.to_s
      p "Fulfilled: " + want.fulfilled.to_s
      p "*" * 100
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
    p "notifying....!"
    wants = Want.all
    wants.each do |want|
      # if (want.fulfilled == true) && (want.notified == false)

      # if is sulfilled and not notified
      # next if !want.fulfilled || want.notified

      # next unless want.fulfilled && !want.notified

      account_sid = ENV["ACCOUNT_SID"]
      auth_token = ENV["AUTH_TOKEN"]
      client = Twilio::REST::Client.new account_sid, auth_token

      from = ENV['TWILIO_NUMBER'] # Your Twilio number

      # friends = {
      #   ENV['DANI_NUMBER']   => "Dani",
      #   ENV['KELSEY_NUMBER'] => "Kelsey",
      #   ENV['MARY_NUMBER']   => "Mary",
      # }

      friends.each do |key, value|
        client.account.messages.create(
          :from => from,
          :to => key,
          :body => "Hey #{value}, the #{want.product_id} meets your ideal price! You guys are the best"
        )
        puts "Sent message to #{value}"
      end
    end

      # device_token = '123abc456def'

      # APNS.send_notification(device_token, :alert => 'Hello iPhone!', :badge => 1, :sound => 'default')

      # notified = true
    end
  end
# end
