require 'rails_helper'

RSpec.describe 'user', type: :model do
  before(:example) do
    @user = User.new(name: 'Joaquin',
                     bio: 'Full-stack developer fond of algorithms, I like exercising and love to learn new things!')
  end

  describe 'validation' do
    it 'correctly validates fields' do
      @user.save
      expect(@user).to be_valid

      @user = User.new(bio: 'forgot name')
      @user.save
      expect(@user).to_not be_valid
    end

    it 'correctly validates PostsCounter' do
      @user.PostsCounter = 0.5
      @user.save
      expect(@user).to_not be_valid

      @user.PostsCounter = -1
      @user.save
      expect(@user).to_not be_valid
    end
  end

  describe 'methods' do
    it 'correctly uses most_recent_posts' do
      recent_posts = @user.most_recent_posts
      expect(recent_posts).to eql(0)
    end
  end
end
