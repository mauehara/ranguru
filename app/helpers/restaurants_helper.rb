module RestaurantsHelper
	require 'lib/jruby_mahout/recommender'
  require 'lib/jruby_mahout/recommender_builder'
  require 'lib/jruby_mahout/data_model'
  require 'lib/jruby_mahout/evaluator'
  require 'csv'

  def get_recommendations_with_friends(user_id, friends)
  	session[:current_user_recommendations] = get_recommendations(user_id)

    # friends.each do |friend|
    #   recommendations_friend =  get_recommendations(friend.id)
    #   session[:current_user_recommendations] = session[:current_user_recommendations] + recommendations_friend
    # end

    friends.each do |friend|
      recommendations_friend =  get_recommendations(friend.id)
      recommendations_friend.each do |recommendation_friend|
        recommendation_in_array = session[:current_user_recommendations].assoc(recommendation_friend[0])
        if (recommendation_in_array == nil)
          session[:current_user_recommendations] << recommendation_friend
        else
          average_rating = (recommendation_in_array[1] + recommendation_friend[1]) / 2.to_f
          index_in_array = session[:current_user_recommendations].index(recommendation_in_array)
          session[:current_user_recommendations][index_in_array][1] = average_rating
        end
      end
    end

    session[:current_user_recommendations].sort! do |a, b|
      b[1] <=> a[1]
      
    end

    self.current_user_recommendations = session[:current_user_recommendations]
  end

  def current_user_recommendations=(recommendations)
		@current_user_recommendations = recommendations
	end

  def reset_current_user_recommendations
    session[:current_user_recommendations] = nil
    self.current_user_recommendations = nil
  end

	def current_user_recommendations
    # @current_user_recommendations || get_recommendations(current_user.id)
		get_recommendations_with_friends(current_user.id, friends)
	end

	def has_enough_recommendations
		redirect_to restaurants_path, notice: "Por favor, avalie alguns restaurantes" unless current_user_recommendations.length > 0
	end

  def restaurants_rated
    Rating.where(:user_id => session[:current_user_id]).size
  end

  private

  def get_recommendations(user_id = 1)
    recommender = JrubyMahout::Recommender.new("EuclideanDistanceSimilarity", 20, "GenericUserBasedRecommender", false)
    #recommender.data_model = JrubyMahout::DataModel.new("mysql", { }).data_model
    recommender.data_model = JrubyMahout::DataModel.new("file", {:file_path => "_ratings.csv"}).data_model
    @evaluation = recommender.evaluate(0.7, 0.3)
    recommender.recommend(user_id, 30, nil)
  end

  def index_recommendation=(index)
    @index_recommendation = index
  end

  def index_recommendation
    @index_recommendation || session[:index_recommendation]
  end

  def reset_index_recommendation
    session[:index_recommendation] = -1
    self.index_recommendation = session[:index_recommendation]
  end

  def increase_index_recommendation
    if ((current_user_recommendations.length) -1) > session[:index_recommendation]
      session[:index_recommendation] += 1
    else
      session[:index_recommendation] = 0
    end
    self.index_recommendation = session[:index_recommendation]
  end
end
