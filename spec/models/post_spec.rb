require 'rails_helper'

RSpec.describe 'post', type: :model do
  before(:example) { @post = Post.new(title: 'test', text: 'test', user_id: 1) }

  describe 'validation' do
    it 'correctly validates fields' do
      @post.save
      expect(@post).to be_valid

      @post = Post.new(text: 'test', user_id: 1)
      @post.save
      expect(@post).to_not be_valid
    end

    it 'correctly validates length' do
      title = 'F' * 251
      @post = Post.new(title, Text: 'test', user_id: 1)
      @post.save
      expect(@post).to_not be_valid
    end

    it 'correctly validates CommentsCounter' do
      @post.commentsCounter = 0.5
      @post.save
      expect(@post).to_not be_valid

      @post.commentsCounter = -1
      @post.save
      expect(@post).to_not be_valid
    end

    it 'correctly validates LikesCounter' do
      @post.likesCounter = 0.1
      @post.save
      expect(post).to_not be_valid

      @post.likesCounter = -1
      @post.save
      expect(post).to_not be_valid
    end
  end

  describe 'methods' do
    it 'correctly updates postsCounter' do
      @post.save
      expect(@post.user.postsCounter).to eql(1)
    end

    it 'correctly uses most_recent_comments' do
      recent_comments = @post.most_recent_comments
      expect(recent_comments.count).to eq(0)
    end
  end
end
