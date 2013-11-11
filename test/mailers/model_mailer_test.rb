require 'test_helper'

class ModelMailerTest < ActionMailer::TestCase
  test "request_feedback_notification" do
    mail = ModelMailer.request_feedback_notification
    assert_equal "Request feedback notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
