class Post < ActiveRecord::Base
  has_many :reddits, as: :resource
  has_many :comments, as: :commentable

  validates :title, :description, presence: true
end
