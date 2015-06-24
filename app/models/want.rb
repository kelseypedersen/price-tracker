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
      p "ONLINE PRICE"
      p currentShopstylePrice = client["priceLabel"]

      price = currentShopstylePrice[1..-1]
# Check price for commas, if there are then take them out.
# Make your price an array and if the index does not contain a comma, push it into an array.
      good_price = price.to_s.gsub!(/\D/, "").to_i
      # good_price = price.to_s.gsub!(/[$]/, "").to_i
      p "GSUB price"
      p good_price
      # gsub for commas
      want.update(notified: false)
      if (good_price < want.max_price.to_i)
        p "ITEM PRICE"
        p price.to_i
        p "MAX PRICE"
        p want.max_price.to_i
          # want.fulfilled = true
        # p want.fulfilled
        want.update( fulfilled: true)
        p want.fulfilled
        # Do we want logic here for the price going back higher again?
      elsif (good_price > want.max_price.to_i)
          # want.fulfilled = false
          want.update(fulfilled: false)
          p "GREATER THAN MAX PRICE!!!!!!!!"
      else
        p "no difference, should not see this"
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
      userId = want.user_id
      user = User.find(userId)
      user_phone = "+1" + user.phone_number

      p "NOTIFIED"
      p want.notified
      p "FULFILLED"
      p want.fulfilled
      if ((want.notified == false) && (want.fulfilled == true))
        # next if !want.fulfilled || want.notified
        # next unless want.fulfilled && !want.notified
        puts "in next loop"
        account_sid = ENV["ACCOUNT_SID"]
        auth_token = ENV["AUTH_TOKEN"]
        client = Twilio::REST::Client.new account_sid, auth_token

        from = ENV['TWILIO_NUMBER'] # Your Twilio number

          client.account.messages.create(
            :from => from,
            :to => user_phone,
            :body => "Hey #{user.name}, the #{want.product_id} meets your ideal price!"
          )
          puts "Sent message to #{user_phone}"
          want.notified = true
      end
    end
  end
end

