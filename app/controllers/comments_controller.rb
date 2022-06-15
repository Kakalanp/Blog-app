class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      redirect_to root_path, notice: 'Comment was successfully created'
    else
      render :new, alert: 'Comment was not created'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(user_id: @comment.user_id, id: @comment.post_id),
                notice: 'Your comment has been deleted successfully'
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :post_id).reverse_merge({ post_id: params[:post_id] })
  end
end
