module RestaurantsHelper
	require 'lib/jruby_mahout/recommender'
  require 'lib/jruby_mahout/recommender_builder'
  require 'lib/jruby_mahout/data_model'
  require 'lib/jruby_mahout/evaluator'

  def get_recommendations(user_id = current_user.id)
  	session[:current_user_recommendations] = get_recommendations(user_id)
		self.current_user_recommendations = session[:current_user_recommendations]
  end

  def current_user_recommendations=(recommendations)
		@current_user_recommendations = recommendations
	end

	def current_user_recommendations
		@current_user_recommendations || get_recommendations(current_user.id)
	end

	def has_enough_recommendations
		redirect_to restaurants_path, notice: "Por favor, avalie alguns restaurantes" unless current_user_recommendations.length > 0
	end

  private

  def get_recommendations(user_id = 1)
    recommender = JrubyMahout::Recommender.new("PearsonCorrelationSimilarity", 10, "GenericUserBasedRecommender", false)
    #recommender.data_model = JrubyMahout::DataModel.new("mysql", { }).data_model
    recommender.data_model = JrubyMahout::DataModel.new("file", {:file_path => "_ratings.csv"}).data_model
    @evaluation = recommender.evaluate(0.7, 0.3)
    recommender.recommend(user_id, 30, nil)
  end

  def get_index_recommendation
    session[:index_recommendation]
  end

  def reset_index_recommendation
    session[:index_recommendation] = -1
  end

  def increase_index_recommendation
    if ((current_user_recommendations.length) -1) > session[:index_recommendation]
      session[:index_recommendation] += 1
    else
      session[:index_recommendation] = 0
    end
  end
end
