module SessionsHelper

	def sign_in(user)
		session[:current_user_id] = user.id
		self.current_user = user
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		self.current_user = nil
		session[:current_user_id] = nil
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

end
