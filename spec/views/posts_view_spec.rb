require 'rails_helper'

RSpec.describe 'posts_view', type: :system do
  describe 'index' do
    it 'shows the correct content' do
      visit user_posts_path(user_id: 1)
      expect(page).to have_content('All posts from ')
    end
  end

  describe 'show' do
    it 'shows the correct content' do
      user_id = 1
      id = 2
      visit user_post_path(user_id, id)
      expect(page).to have_content('by: ')
    end
  end
end
