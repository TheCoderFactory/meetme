require 'test_helper'

class InviteMailerTest < ActionMailer::TestCase
  test "invited" do
    mail = InviteMailer.invited
    assert_equal "Invited", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
