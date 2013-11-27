namespace :ranguru do

	task :update_images => :environment do

		Restaurant.find_each do |r|
			i = r.image_url
			puts i
			i = i.gsub(/ms.jpg/, 'l.jpg') unless i.nil?
			puts i
			r.image_url = i
			r.save
		end

	end
end