ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  def create_user(id, name, email, password)
    user = User.create(id: id, name: name, email: email)
    user.password = User.digest(password)
    user
  end


end
