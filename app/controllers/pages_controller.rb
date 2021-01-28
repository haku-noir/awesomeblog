class PagesController < ApplicationController
  def home
    if session[:user_id]
      render 'users/home_feed'
    end
  end

  def about
  end
end
