class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    link = Link.create! link_params
    link.reddits.create! user: current_user

    redirect_to root_path
  end

  private

  def link_params
    params.require(:link).
      permit(:title, :url)
  end
end
