require 'rails_helper'

RSpec.describe 'user', type: :model do

  describe 'validation' do
    it 'correctly validates fields' do
      user = User.new(name: 'Joaquin', email: 'test@test.com', password: 'password')
      user.save
      expect(user).to be_valid

      user = User.new(email: 'test@test.com', password: 'password')
      user.save
      expect(user).to_not be_valid
    end

    it 'correctly validates PostsCounter' do
      user = User.new(name: 'Joaquin', email: 'test@test.com', password: 'password')
      user.postsCounter = 0.5
      user.save
      expect(user).to_not be_valid

      user.postsCounter = -1
      user.save
      expect(user).to_not be_valid
    end
  end

  describe 'methods' do
    it 'correctly uses most_recent_posts' do
      user = User.new(name: 'Joaquin', email: 'test@test.com', password: 'password')
      recent_posts = user.most_recent_posts
      expect(recent_posts).to eql(0)
    end
  end
end
