class UsersController < ApplicationController
	before_action :signed_in_user, only: [:show]
	before_action :correct_user, only: [:show]
	
	def create
		@user = User.new(user_params)
    if @user.save
    	sign_in @user
      redirect_to controller: 'restaurants', action: 'index'
    else
      render 'new'
    end
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
  	end

	def index
		@users= User.search(params[:search]).paginate(:page => params[:page], :per_page => 20)
	end

	def modal
		@user = User.find(params[:user_id])
	end

	def add_friend	    
		@session = session[:return_to]
		user_id = params[:user_id]
		add_remove_friend_session(user_id)
		# redirect_to controler:'welcome', action: 'recommender'
	end

	def return_to_origin
		if friends_return == "index"
	    	redirect_to root_url
	    else
	      if friends_return == "recommender"
	    	 redirect_to controler:'welcome', action: 'recommender'
	      end
	    end
		# redirect_to session.delete(:return_to)
		
		redirect_to root_url
		return
	end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
