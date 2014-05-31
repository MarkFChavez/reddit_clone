class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def show
    @post = Post.find params[:id]
    @comment = Comment.new
  end

  def create
    @post = Post.new post_params
    @post.reddits.build user: current_user

    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).
      permit(:title, :description)
  end
end
