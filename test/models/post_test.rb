require "test_helper"

class PostTest < ActiveSupport::TestCase
  def test_has_many_reddits
    post = posts(:tdd_is_dead)
    assert_respond_to post, :reddits
  end
end
