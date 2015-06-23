class Want < ActiveRecord::Base

  belongs_to :user
  has_many :products

  def self.checking
    puts "Checking shopstyle from model!"
  end

end
