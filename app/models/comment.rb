class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :content, presence: { message: "Comment can't be blank" }

  def user
    super || NullUser.new
  end
end
