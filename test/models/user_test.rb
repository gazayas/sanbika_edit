require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "fixture" do
    user = User.first
    user.password = "password" # この２行をヘルパーにすること
    user.password_digest = User.digest(user.password)
    assert user.valid?
  end

  test "適切な変数のユーザーが上手く登録される" do
    user = create_user
    user.name = "sup_my_names_geeb"
    user.email = "geeb1@gmail.com"
    user.password = "password"
    assert user.valid?
  end

  # user = create_user が上手く行ったかどうかを確認するために、
  # 直接その後に assert user.valid? を書いてもいい
  test "ユーザー名は短い" do
    user = User.first
    user.password = "password"
    user.password_digest = User.digest(user.password)
    assert user.valid?
    user.name = "gabe"
    assert user.invalid?
  end

  test "ユーザー名が長い" do
    user = create_user
    user.name = "1234567890123456789012345678901"
    assert user.invalid?
  end

  test "ユーザー名はない" do
    user = create_user
    user.name = nil
    assert user.invalid?
  end

  test "適切なメールアドレスではない" do
    user = create_user
    user.email = "example-email.com"
    assert user.invalid?
  end

  test "メールアドレスはない" do
    user = create_user
    user.email = nil
    assert user.invalid?
  end

  test "パスワードは短い" do
    user = create_user
    user.password = "hey"
    assert user.invalid?
  end

  test "パスワードは長い" do
    user = create_user
    user.password = "1234567890123456789012345678901234567890"
    assert user.invalid?
  end

  test "パスワードはない" do
    user = create_user
    user.password = nil
    assert user.invalid?
  end

  test "パスワードの暗号化機能" do # User.digest(string) は create_user で行われる
    user = create_user
    assert_equal user.password, "password"
    assert_not_equal user.password, user.password_digest
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
