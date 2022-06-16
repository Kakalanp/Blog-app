require 'rails_helper'

RSpec.describe 'comment', type: :model do
  describe 'validation' do
    it 'correctly validates fields' do
      comment = Comment.new(text: 'testing commnent', post_id: 1, user_id: 1)
      comment.save
      expect(comment).to be_valid

      comment = Comment.new(text: 'testing commnent', user_id: 1)
      comment.save
      expect(comment).to_not be_valid
    end
  end

  describe 'methods' do
    it 'correctly uses update_comments_counter' do
      comment = Comment.new(text: 'testing commnent', post_id: 1, user_id: 1)
      comment.save
      comment.send(:update_comments_counter)
      expect(comment.post.commentsCounter).to eql(3)
    end
  end
end
