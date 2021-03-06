class WelcomeController < ApplicationController
  before_action :signed_in_user
  before_action :has_enough_recommendations
  before_filter :set_index_recommendation

  def index
	
  end

  def recommender  	
  	@recommendations = current_user_recommendations  
    @index_recommendation = index_recommendation
  	restaurant_id = (@recommendations[@index_recommendation])[0]
  	@restaurant = Restaurant.find(restaurant_id)
    @friends = session[:friends]
  end 

  def finalize
    @recommendations = current_user_recommendations  
    @index_recommendation = index_recommendation
    restaurant_id = (@recommendations[@index_recommendation])[0]
    reset_current_user_recommendations
    @restaurant = Restaurant.find(restaurant_id)
    @recommendation = Recommendation.create(user_id: current_user.id, restaurant_id: restaurant_id)
  end

  def add_friends
    redirect_to users_url
    # user_id = params[:user_id]
    # add_friend_to_session(user_id)
    # redirect_to controler:'welcome', action: 'recommender'
  end

  private
  def set_index_recommendation
  	if params[:action] == "index"
    	reset_index_recommendation
    else
      if params[:action] == "recommender"
    	 increase_index_recommendation
      end
    end
  end
end
