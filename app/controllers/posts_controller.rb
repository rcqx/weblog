class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    # @comments = @user.comments
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
end
