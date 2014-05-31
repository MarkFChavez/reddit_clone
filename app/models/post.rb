class Post < ActiveRecord::Base
  has_many :reddits, as: :resource
end
