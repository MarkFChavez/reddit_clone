require "test_helper"

class RedditTest < ActiveSupport::TestCase
  def test_user_association
    reddit = reddits(:one)
    assert_respond_to reddit, :user
  end

  def test_polymorphic_association
    reddit = reddits(:one)
    assert_respond_to reddit, :resource
  end
end
