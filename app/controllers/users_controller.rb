class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @last = @user.last_3_posts
    @user_id = @user.id
  end
end
