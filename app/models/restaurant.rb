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

	def self.search_rated(search, user_id)
		if search
    	joins(:users).where('restaurants.name LIKE ? AND users.id = ?', "%#{search}%", "#{user_id}")
  	else
    	joins(:users).where(users: {id: user_id})
  	end
	end

end
