require 'rails_helper'

RSpec.describe 'Users requests', type: :request do
  describe 'Index method' do
    it 'returns the users list on the root' do
      get root_path
      expect(response).to have_http_status(200)
    end

    it 'returns the users list on normal path' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template in both' do
      get users_path
      expect(response).to render_template(:index)

      get root_path
      expect(response).to render_template(:index)
    end
  end

  describe 'Show method' do
    before(:example) { get user_path(id: 1) }

    it 'returns the data from the correct user' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end
  end
end
