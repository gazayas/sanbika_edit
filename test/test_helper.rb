ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase

  FactoryGirl.define do
    factory :user do
      sequence(:id) {|n| n + 1}
      sequence(:name) {|n| "geeb" + n.to_s}
      sequence(:email) {|n| "geeb" + n.to_s + "@example.com"}
      sequence(:password) {|n| "supbro" + n.to_s}
    end
  end


  fixtures :all
  # これじゃなくてfixtures。というかfixturesじゃなくてFactoryGirl笑
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
