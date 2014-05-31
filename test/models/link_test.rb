require "test_helper"

class LinkTest < ActiveSupport::TestCase
  def test_has_many_reddits
    link = links(:slow_database_test_fallacy)
    assert_respond_to link, :reddits
  end
end
