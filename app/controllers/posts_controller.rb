class PostsController < ApplicationController
  def index
    @user = User.find(params['user_id'])
    @posts = @user.posts.all
  end

  def show
    @user_id = params['user_id']
    @id = params['id']
  end
end
