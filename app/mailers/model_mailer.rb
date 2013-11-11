class ModelMailer < ActionMailer::Base
  require 'time'
  default from: "feedback@ranguru.herokuapp.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.model_mailer.request_feedback_notification.subject
  #
  def request_feedback_notification(user, restaurant)
    @greeting = "Hi"
    @user = user
    @restaurant = restaurant
    #@delivery_time = Time.now.rfc2822   # send now
    # @delivery_time = (Time.now + 10*60).rfc2822  # send in 10 minutes
    @delivery_time = Time.now.end_of_day.rfc2822  # send in the end of day

    headers['X-Mailgun-Deliver-By'] = @delivery_time

    mail to: @user.email
  end
end
