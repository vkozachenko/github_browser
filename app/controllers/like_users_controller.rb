class LikeUsersController < ApplicationController

  def create
    LikeUser.like_user(params[:like_user][:id])
    redirect_to params[:like_user][:redirect_page]
  end

  def destroy
    LikeUser.unlike_user(params[:like_user][:id])
    redirect_to params[:like_user][:redirect_page]
  end

end
