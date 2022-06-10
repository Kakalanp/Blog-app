class UsersController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @user = User.find(User.pluck(:id).sample)
    @comment = @user.comments.new(comment_params)

    if @comment.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, params[:id])
  end
end
