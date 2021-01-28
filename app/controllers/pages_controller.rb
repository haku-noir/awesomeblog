class PagesController < ApplicationController
  def home
    if session[:user_id]
      @microposts = Micropost.all
      @micropost = Micropost.new
      render 'users/home_feed'
    end
  end

  def about
  end
end
