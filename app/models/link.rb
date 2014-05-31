class Link < ActiveRecord::Base
  has_many :reddits, as: :resource
  has_many :comments, as: :commentable

  validates :title, :url, presence: true
end
