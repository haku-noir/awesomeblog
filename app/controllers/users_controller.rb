class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.all
  end

  def followers
    @user = User.find(params[:id])
    @followers = User.where(id: @user.follower_ids)
  end

  def following_users
    @user = User.find(params[:id])
    @following_users = User.where(id: @user.following_ids)
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
