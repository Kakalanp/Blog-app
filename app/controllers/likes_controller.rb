class LikesController < ApplicationController
  def create
    @user = User.find(User.pluck(:id).sample) # gets a random user
    @like = @user.likes.new(like_params)

    redirect_to root_path if @like.save
  end

  private

  def like_params
    params.permit(:post_id, :user_id).reverse_merge({ post_id: params[:id], user_id: params[:user_id] })
  end
end
