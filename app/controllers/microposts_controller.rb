class MicropostsController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @micropost = @user.microposts.new(micropost_params)

    if @micropost.save
      redirect_to root_url
    else
      redirect_to 'users/home_feed'
    end
  end

  def destroy
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end
end
