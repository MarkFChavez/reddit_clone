class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = Post.create! post_params
    post.reddits.create! user: current_user

    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).
      permit(:title, :description)
  end
end
