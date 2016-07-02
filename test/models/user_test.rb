require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

=begin
  test "authenticated? should return false for a user with a nil digest" do
    assert_not @user.authenticated?(:remember, "")
  end
=end

end
