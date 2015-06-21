class Product < ActiveRecord::Base

  belongs_to :want

  def self.search(search)
    if search
      find(:all, :conditions => ["name LIKE ?", "%#{search}%"])
    else
      find(:all)
    end
  end

end
