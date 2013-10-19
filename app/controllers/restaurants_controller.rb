class RestaurantsController < ApplicationController
  
  def index
  	@restaurants = Restaurant.search(params[:search]).paginate(:page => params[:page], :per_page => 20)
  end

  def modal
  	@restaurant = Restaurant.find(params[:restaurant_id])
  end

  def rate
  	@restaurant_id = params[:restaurant_id]
  	@restaurant_rating_value = params[:restaurant_rating_value]
  	@rating = Rating.create(user_id: current_user.id, restaurant_id: @restaurant_id, rating: @restaurant_rating_value)
  end

end
