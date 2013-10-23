class WelcomeController < ApplicationController
  before_action :signed_in_user
  before_action :has_enough_recommendations
  before_filter :set_index_recommendation

  def index
  	
  end

  def recommender  	
  	@recommendations = current_user_recommendations  
  	@index_recommendation = get_index_recommendation
  	restaurant_id = (@recommendations[@index_recommendation])[0]
  	@restaurant = Restaurant.find(restaurant_id)
  end 

  private
  def set_index_recommendation
  	if params[:action] == "index"
    	reset_index_recommendation
    else
    	increase_index_recommendation
    end
  end
end
