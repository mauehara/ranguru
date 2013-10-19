class RestaurantsController < ApplicationController
  
  def index
  	@restaurants = Restaurant.search(params[:search]).paginate(:page => params[:page], :per_page => 20)
  end

end
