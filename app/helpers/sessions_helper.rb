module SessionsHelper

	def sign_in(user)
		session[:current_user_id] = user.id
		session[:friends] = []
		session[:index_recommendation] = -1
		self.current_user = user
		self.friends = []
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		self.current_user = nil
		session[:current_user_id] = nil
		session[:current_user_recommendations] = nil
		session[:friends] = nil
		session[:index_recommendation] = nil
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user?(user)
		user == current_user
	end

	def current_user
		@current_user || User.find_by(id: session[:current_user_id])
	end

	def signed_in_user
	 	redirect_to signin_url, notice: "Please sign in." unless signed_in?
	end

	def not_signed_in_user
		redirect_to root_url unless !signed_in?
	end

	def correct_user
		@user = User.find(params[:id])
		redirect_to root_url unless current_user?(@user)
	end

	def friends=(friends)
		@friends = friends
	end

	def friends
		@friends || session[:friends]
	end

	def friends_return=(friends_return)
		@friends_return = friends_return
	end

	def friends_return
		@friends_return || session[:friends_return]
	end	

	def set_friends_return(friends_return)
		session[:friends_return] = friends_return
	end	


  def add_remove_friend_session(user_id)
    friend = User.find(user_id)
    if friend_is_in_session(user_id)
    	session[:friends].delete(friend)
    else
    	session[:friends] << friend
    end
    self.friends = session[:friends]
    reset_index_recommendation
    redirect_to users_url
  end

  def friend_is_in_session(user_id)
  	friend = User.find(user_id)
    session[:friends].include?(friend)
  end

  def reset_session
  	session[:friends] = []
  end
end
