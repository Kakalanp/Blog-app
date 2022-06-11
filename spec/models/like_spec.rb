require 'rails_helper'

RSpec.describe 'like', type: :model do
  before(:example) { @like = Like.new(user_id: 1, post_id: 1) }

  describe 'validation' do
    it 'correctly validates fields' do
      @like.save
      expect(@like).to be_valid

      @like = Like.new(user_id: 1)
      @like.save
      expect(@like).to_not be_valid
    end
  end

  describe 'methods' do
    it 'correctly uses update_like_counter' do
      @like.save
      @like.update_like_counter
      expect(@like.post.likesCounter).to eql(1)
    end
  end
end
