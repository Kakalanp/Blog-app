class PostsController < ApplicationController
  def index
    @user = User.find(params['user_id'])
    @posts = @user.posts.all
  end

  def show
    @user = User.find(params['user_id'])
    @post = Post.find(params['id'])
  end

  def new
    @user = User.find(params['user_id'])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    redirect_to action: 'index'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :user_id)
  end
end
