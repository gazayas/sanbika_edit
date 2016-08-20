require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "ユーザーが上手く登録される" do
    name = "namesgabe"
    email = "example@example.com"
    password = "password"
    user = create_user(1, name, email, password)
    assert user.valid?
  end

  test "ユーザー名は短い" do
    name = "gabe"
    email = "gabe@example.com"
    password = "password"
    user = create_user(1, name, email, password)
    assert user.invalid?
  end

  test "ユーザー名が長い" do
    name = "1234567890123456789012345678901"
    email = "example@example.com"
    password = "password"
    user = create_user(1, name, email, password)
    assert user.invalid?
  end

  test "メールアドレスではない" do
    name = "namesgabe"
    email = "example-email.com"
    password = "password"
    user = create_user(1, name, email, password)
    assert user.invalid?
  end

  test "パスワードは短い" do
    name = "namesgabe"
    email = "example@example.com"
    password="os"
    user = create_user(1, name, email, password)
    assert user.invalid?
  end


=begin
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  test "authenticated? should return false for a user with a nil digest" do
    assert_not @user.authenticated?(:remember, "")
  end
=end

end
