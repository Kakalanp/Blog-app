require 'rails_helper'

RSpec.describe 'Posts views', type: :system do
  describe 'Index' do
    it 'shows the correct content' do
      visit user_posts_path(user_id: 1)
      expect(page).to have_content('Here is a list of posts from a given user id')
    end
  end

  describe 'Show' do
    it 'shows the correct content' do
      id = 1
      post = 2
      visit user_post_path(id, post)
      expect(page).to have_content("This is the post: #{post} from the user: #{id}")
    end
  end
end
