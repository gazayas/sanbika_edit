require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "account_activation" do
    #user = User.first
    user = FactoryGirl.create(:user)    
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Account Activation", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply"], mail.from
    assert_match user.name, mail.body.encoded
    assert_match user.activation_token, mail.body.encoded
    assert_match CGI.escape(user.email), mail.body.encoded
  end

=begin
  test "password_reset" do
    user = User.first # idは...
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    mail = UserMailer.password_reset(user)
    assert_equal "パスワード更新", mail.subject

    # assert_equal ["to@example.org"], mail.to
    # assert_equal ["noreply"], mail.from
    # assert_match "Hi", mail.body.encoded
  end
=end

end
