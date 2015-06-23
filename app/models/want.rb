class Want < ActiveRecord::Base

  belongs_to :user
  has_many :products

end
