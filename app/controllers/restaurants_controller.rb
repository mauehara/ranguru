class RestaurantsController < ApplicationController
  
  def index
  	@restaurants = Restaurant.paginate(:page => params[:page], :per_page => 20)
  end

end
