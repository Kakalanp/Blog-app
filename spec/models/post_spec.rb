require 'rails_helper'

RSpec.describe 'post', type: :model do
  describe 'validation' do
    it 'correctly validates fields' do
      post = Post.new(title: 'test', text: 'test', user_id: 1, commentsCounter: 0, likesCounter: 0)
      post.save
      expect(post).to be_valid

      post = Post.new(text: 'test', user_id: 1, commentsCounter: 0, likesCounter: 0)
      post.save
      expect(post).to_not be_valid
    end

    it 'correctly validates length' do
      title = 'F' * 251
      post = Post.new(title:, text: 'test', user_id: 1, commentsCounter: 0, likesCounter: 0)
      post.save
      expect(post).to_not be_valid
    end

    it 'correctly validates CommentsCounter' do
      post = Post.new(title: 'test', text: 'test', user_id: 1, commentsCounter: 0.5, likesCounter: 0)
      post.save
      expect(post).to_not be_valid

      post = Post.new(title: 'test', text: 'test', user_id: 1, commentsCounter: -1, likesCounter: 0)
      post.save
      expect(post).to_not be_valid
    end

    it 'correctly validates LikesCounter' do
      post = Post.new(title: 'test', text: 'test', user_id: 1, commentsCounter: 0, likesCounter: 0.1)
      post.save
      expect(post).to_not be_valid

      post = Post.new(title: 'test', text: 'test', user_id: 1, commentsCounter: 0, likesCounter: -1)
      post.save
      expect(post).to_not be_valid
    end
  end

  describe 'methods' do
    it 'correctly updates postsCounter' do
      post = Post.new(title: 'test', text: 'test', user_id: 1, commentsCounter: 0, likesCounter: 0)
      post.save
      expect(post.user.postsCounter).to eql(2)
    end

    it 'correctly uses most_recent_comments' do
      post = Post.new(title: 'test', text: 'test', user_id: 1, commentsCounter: 0, likesCounter: 0)
      recent_comments = post.send(:most_recent_comments)
      expect(recent_comments.count).to eq(0)
    end
  end
end
