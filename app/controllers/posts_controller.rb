class PostsController < ApplicationController
  def index
    @user = User.find(params['user_id'])
    @posts = @user.posts.includes(:comments)
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
    @post.commentsCounter = 0
    @post.likesCounter = 0

    if @post.save
      redirect_to root_path, notice: 'Post was successfully created'
    else
      render :new, alert: 'Post could not be created'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :user_id).reverse_merge({ user_id: params['user_id'] })
  end
end
