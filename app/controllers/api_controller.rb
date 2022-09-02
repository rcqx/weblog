class ApiController < ApplicationController
  def api
    json_comment = Comment.new(text: params[:text])
    json_comment.user_id = params[:user_id]
    json_comment.post_id = params[:id]

    if json_comment.save
      render json: { comment: json_comment }, status: :created
    else
      render json: { errors: json_comment.errors.full_messages },
      status: :unprocessable_entity
    end

  end

end