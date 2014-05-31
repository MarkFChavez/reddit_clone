require "test_helper"

class UserTest < ActiveSupport::TestCase
  def test_reddits
    mark = users(:mark)
    assert_respond_to mark, :reddits
  end
end
