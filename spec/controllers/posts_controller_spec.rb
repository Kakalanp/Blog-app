require 'rails_helper'

RSpec.describe 'Posts requests', type: :request do
  describe 'Index method' do
    before(:example) { get user_posts_path(user_id: 1) }

    it 'returns the list of posts for a given user' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template for a list of posts for a given user' do
      expect(response).to render_template(:index)
    end
  end

  describe 'Show method' do
    before(:example) { get user_post_path(user_id: 1, id: 1) }

    it 'returns the correct data of a post from a given user' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end
  end
end
