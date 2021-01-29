class RelationshipsController < ApplicationController
  def create
    other_user = User.find(params[:followed_id])
    current_user = User.find(session[:user_id])
    current_user.follow(other_user)

    redirect_to user_url(other_user)
  end

  def destroy
    other_user = User.find(params[:id])
    current_user = User.find(session[:user_id])
    current_user.unfollow(other_user)

    redirect_to user_url(other_user)
  end
end
