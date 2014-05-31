class CommentsController < ApplicationController
  before_filter :load_commentable

  def create
    @comment = current_user.comments.build comment_params
    @comment.commentable = @commentable
    
    if @comment.save
      redirect_to @commentable
    else
      redirect_to @commentable, alert: @comment.errors.full_messages
    end
  end

  private

  def load_commentable
    klass = [Post, Link].detect { |c| params["#{c.name.underscore}_id"] }
    @commentable = klass.find params["#{klass.name.underscore}_id"]
  end

  def comment_params
    params.require(:comment).
      permit(:content)
  end
end
