class UsersController < ApplicationController
	before_action :signed_in_user, only: [:show]
	before_action :correct_user, only: [:show]
	
	def create
		@user = User.new(user_params)
    if @user.save
      redirect_to @user
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

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
