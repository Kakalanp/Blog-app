require 'rails_helper'

RSpec.describe 'users_controller', type: :request do
  describe 'index action' do
    it 'returns the correct list of users' do
      get root_path
      expect(response).to have_http_status(:ok)

      get users_path
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      get users_path
      expect(response).to render_template(:index)

      get root_path
      expect(response).to render_template(:index)
    end
  end

  describe 'show action' do
    before(:example) { get user_path(id: 1) }

    it 'returns the data from the correct user' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end
  end
end
