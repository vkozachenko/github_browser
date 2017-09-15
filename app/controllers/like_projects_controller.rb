class LikeProjectsController < ApplicationController

  def create
    LikeProject.like_project(params[:like_project][:id])
    redirect_to params[:like_project][:redirect_page]
  end

  def destroy
    LikeProject.unlike_project(params[:like_project][:id])
    redirect_to params[:like_project][:redirect_page]
  end

end
