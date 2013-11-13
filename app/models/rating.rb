class Rating < ActiveRecord::Base
	belongs_to :restaurant
	belongs_to :user

	def self.save_to_csv
		CSV.open("_ratings.csv", "w") do |csv|
			all.each do |rating|
				csv << [rating.user_id, rating.restaurant_id, rating.rating]
			end
		end
	end

end
