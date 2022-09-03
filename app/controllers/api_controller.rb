class ApiController < ApplicationController
 protect_from_forgery with: :null_session
  before_action :tokenized
  before_action :authenticate_user!

  def comment_api
    json_comment = Comment.new(text: params[:text])
    json_comment.user_id = current_user.id
    json_comment.post_id = params[:id]

    if json_comment.save
      render json: { comment: json_comment }, status: :created
    else
      render json: { errors: json_comment.errors.full_messages },
      status: :unprocessable_entity
    end

  end
  

  def comments_index
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = @post.comments
    render :json => @comments if tokenized
  end
  
  def posts_index
    @user = User.find(params[:user_id])
    @posts = @user.posts
    render :json => @posts if tokenized
  end

end