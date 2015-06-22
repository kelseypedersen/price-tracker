class Product < ActiveRecord::Base

  belongs_to :want

  # def self.search(search)
  #   if search
  #     where(:all, :conditions => ["name LIKE ?", "%#{search}%"])
  #   end
  # end

end
