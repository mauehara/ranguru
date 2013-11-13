class RestaurantsController < ApplicationController

  def index
  	@restaurants = Restaurant.search(params[:search]).paginate(:page => params[:page], :per_page => 20)
  end

  def rated
    @restaurants = Restaurant.search_rated(params[:search], current_user.id).paginate(:page => params[:page], :per_page => 20)
  end

  def modal
  	@restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant_rating = @restaurant.ratings.where('ratings.user_id = ?', "#{current_user.id}").first
    if !@restaurant_rating.nil? 
      @restaurant_rating_value = @restaurant_rating.rating
    end
  end

  def rate
  	@restaurant_id = params[:restaurant_id]
  	@restaurant_rating_value = params[:restaurant_rating_value]
  	@rating = Rating.find_or_initialize_by(user_id: current_user.id, restaurant_id: @restaurant_id)
    @rating.rating = @restaurant_rating_value

    if @rating.save
      Rating.save_to_csv # Solução temporária ao problema da lentidão do mysql
    end
    
    redirect_to root_path
  end 

end
