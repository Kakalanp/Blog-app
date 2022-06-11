require 'rails_helper'

RSpec.describe 'posts_controller', type: :request do
  describe 'index action' do
    before(:example) { get user_posts_path(user_id: 1) }

    it 'returns the list of posts for a given user' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'show action' do
    before(:example) { get user_post_path(user_id: 1, id: 1) }

    it 'returns the correct data of a post from a given user' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end
  end
end
