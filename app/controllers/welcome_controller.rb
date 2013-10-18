class WelcomeController < ApplicationController
  require 'lib/jruby_mahout/recommender'
  require 'lib/jruby_mahout/recommender_builder'
  require 'lib/jruby_mahout/data_model'
  require 'lib/jruby_mahout/evaluator'

  before_action :signed_in_user

  def index
  end

  def recommender
    recommender = JrubyMahout::Recommender.new("PearsonCorrelationSimilarity", 10, "GenericUserBasedRecommender", false)
    #recommender.data_model = JrubyMahout::DataModel.new("mysql", { }).data_model
    recommender.data_model = JrubyMahout::DataModel.new("file", {:file_path => "_ratings.csv"}).data_model
    @recommendations = recommender.recommend(1, 1, nil)
    @evaluation = recommender.evaluate(0.7, 0.3)
    @user = User.first
  end
end
