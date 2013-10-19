class Restaurant < ActiveRecord::Base
	has_many :ratings
	has_many :users, :through => :ratings

	def self.search(search)
  	if search
    	where('name LIKE ?', "%#{search}%")
  	else
    	scoped
  	end
	end

end
