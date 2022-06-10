class PostsController < ApplicationController
  def index
    @user = User.find(params['user_id'])
    @posts = @user.posts.includes(:comment)
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

    if @post.save
      redirect_to root_path, notice: 'Post was successfully created'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :user_id).reverse_merge({ user_id: params['user_id'] })
  end
end
