class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)

    redirect_to root_path, notice: 'Like succesfully added' if @like.save
  end

  private

  def like_params
    params.permit(:post_id, :user_id).reverse_merge({ post_id: params[:id], user_id: params[:user_id] })
  end
end
