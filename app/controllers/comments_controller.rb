class CommentsController < ApplicationController
  def new
    new_comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { new_comment: new_comment } }
    end
  end

  def index
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comments = @post.comments

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render xml: @comments }
      format.json { render json: @comments }
    end
  end

  protect_from_forgery with: :null_session
  before_action :tokenized
  before_action :authenticate_user!
  def create
    new_comment = Comment.new(text: comment_params[:text])
    new_comment.user_id = current_user.id
    new_comment.post_id = params[:id]

    respond_to do |format|
      format.html do
        if new_comment.save
          flash[:success] = 'Comment added successfully!'
          redirect_to user_post_url
        else
          flash.now[:error] = 'Error: Comment could not be saved...'
          render :new, locals: { new_comment: new_comment }
        end
      end
    end
  end

  def destroy
    Comment.destroy(params[:user_id])
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
