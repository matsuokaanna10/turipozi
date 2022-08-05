class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = current_user.posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :image, :self_introduction)
  end
end
