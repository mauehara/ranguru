class WelcomeController < ApplicationController
  before_action :signed_in_user
  before_action :has_enough_recommendations

  def index
  end

end
