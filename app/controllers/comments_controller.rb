class CommentsController < ApplicationController
  def create
    @user = User.find(User.pluck(:id).sample) #gets a random user
    @comment = @user.comments.new(comment_params)

    if @comment.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id).reverse_merge({ post_id: params[:post_id] })
  end
end
