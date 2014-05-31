class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    @link = Link.new link_params
    @link.reddits.build user: current_user

    if @link.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def link_params
    params.require(:link).
      permit(:title, :url)
  end
end
