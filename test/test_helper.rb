ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"
require "minitest/pride"

class ActiveSupport::TestCase
    ActiveRecord::Migration.check_pending!
  fixtures :all

  class << self
    alias :context :describe
  end

  def sign_in email, pass
    visit root_path

    fill_in 'Email', with: email
    fill_in 'Password', with: pass
    click_on 'Sign in'
  end
end
