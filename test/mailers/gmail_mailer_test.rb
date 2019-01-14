require 'test_helper'

class GmailMailerTest < ActionMailer::TestCase
  test "send_update" do
    mail = GmailMailer.send_update
    assert_equal "Send update", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
