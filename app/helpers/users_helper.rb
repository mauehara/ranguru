module UsersHelper

	def active_if_signup_first_step
		' active' if controller_name == "users"
	end

	def active_if_signup_second_step
		' active' if controller_name == "restaurants"
	end

	def active_if_signup_third_step
		' active' if controller_name == "welcome"
	end

end
