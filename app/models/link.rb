class Link < ActiveRecord::Base
  has_many :reddits, as: :resource

  validates :title, :url, presence: true
end
