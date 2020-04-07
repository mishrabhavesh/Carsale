require 'test_helper'

class StatusMailerTest < ActionMailer::TestCase
  test "status_email" do
    mail = StatusMailer.status_email
    assert_equal "Status email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
