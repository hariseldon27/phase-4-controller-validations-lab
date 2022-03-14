class PostsController < ApplicationController

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = find_post

    post.update!(post_params)

    render json: post
  rescue ActiveRecord::RecordInvalid => invalid

    render json: {errors: invalid.record.errors }, status: :unprocessable_entity
    
  end

  private

  def find_post
    Post.find(params[:id])
  end
  def post_params
    params.permit(:category, :content, :title)
  end

end
