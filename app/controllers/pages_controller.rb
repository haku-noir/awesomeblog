class PagesController < ApplicationController
  def home
    if session[:user_id]
      @micropost = Micropost.new
      render 'users/home_feed'
    end
  end

  def about
  end
end
