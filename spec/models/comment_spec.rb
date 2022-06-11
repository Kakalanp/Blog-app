require 'rails_helper'

RSpec.describe 'comment', type: :model do
  before(:example) { @comment = Comment.new(text: 'test', post_id: 1, user_id: 1) }

  describe 'validation' do
    it 'correctly validates fields' do
      @comment.save
      expect(@comment).to be_valid

      @comment = Comment.new(text: 'no post', user_id: 1)
      @comment.save
      expect(@comment).to_not be_valid
    end
  end

  describe 'methods' do
    it 'correctly uses update_comments_counter' do
      @comment.save
      @comment.update_comments_counter
      expect(@comment.post.commentsCounter).to eql(1)
    end
  end
end
