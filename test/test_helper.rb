ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # これをFactory Girlsでした方がいいと思うけどな...
  def create_user
    # user.valid?はfalseの時、user.errors.messagesでエラーをご覧ください
    user = User.new
    user.id = 1
    user.name = "names_gabe"
    user.email = "names_gabe@example.com"

    user.password = "password"
    user.password_digest = User.digest(user.password) # これは User.digest(password) でなくていい？
    time = Time.new
    user.created_at = time.localtime

    activation_token = activation_token = User.new_token
    user.activation_digest = User.digest(activation_token)

    user
  end


end
