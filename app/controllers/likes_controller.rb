class LikesController < ApplicationController
  def create
    new_like = current_user.likes.new(like_params)

    flash[:notice] = new_like.errors.full_messages.to_sentence unless new_like.save

    redirect_to "/users/#{current_user.id}/posts"
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
