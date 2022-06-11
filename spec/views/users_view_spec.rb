require 'rails_helper'

RSpec.describe 'users views', type: :system do
  describe 'index' do
    it 'shows the correct content' do
      visit users_path
      expect(page).to have_content('Here is a list of users:')
    end
  end

  describe 'Show' do
    it 'shows the correct content' do
      id = 1
      visit user_path(id)
      expect(page).to have_content('Latest posts from ')
    end
  end
end
