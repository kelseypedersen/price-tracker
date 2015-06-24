require 'rubygems'
require 'twilio-ruby'

class Want < ActiveRecord::Base

  belongs_to :user
  has_many :products

  def self.checking
    puts "Checking shopstyle from model!"
    wants = Want.all
    wants.each do |want|
      client = HTTParty.get("http://api.shopstyle.com/api/v2/products/#{want.product_id}?pid=uid5001-30368749-95")

      currentShopstylePrice = client["priceLabel"]
      if (currentShopstylePrice == "Sold Out")
      else
        currentShopstylePrice = currentShopstylePrice.split(//)
        currentShopstylePrice.each do |item|
          if item == "$" || item == ","
            currentShopstylePrice.delete(item)
          end
        end
        currentShopstylePrice = currentShopstylePrice.join("")
      end

      p "current price"
      p currentShopstylePrice
      p "max price"
      p want.max_price

      if (currentShopstylePrice == "Sold Out")
      elsif (currentShopstylePrice.to_i <= want.max_price)
        p "Is it filfilled?"
        p want.fulfilled
        want.update(fulfilled: true)
      else (currentShopstylePrice.to_i > want.max_price)
        want.fulfilled = false
      end
    end
  end


  def self.notification
    puts "Sending notification"

    wants = Want.all
    wants.each do |want|
      p want.notified
      p want.fulfilled
      userId = want.user_id
      user = User.find(userId)
      # user_phone = "+1" + user.phone_number

      # if ((want.notified == false) && (want.fulfilled == true))
      # next if !want.fulfilled || want.notified
      next unless want.fulfilled && !want.notified

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
      p "Are they notified?"
      want.update(notified: true)
      end
    end
  end
# end

