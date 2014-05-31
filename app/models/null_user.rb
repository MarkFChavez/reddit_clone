class NullUser
  def email
    ""
  end

  def reddits
    Reddit.none
  end

  def comments
    Comment.none
  end
end
