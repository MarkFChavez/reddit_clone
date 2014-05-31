class Post < ActiveRecord::Base
  has_many :reddits, as: :resource

  validates :title, :description, presence: true
end
