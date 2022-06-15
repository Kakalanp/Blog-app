require 'rails_helper'

RSpec.describe 'Posts index', type: :feature do
  before :each do
    visit user_posts_path(user_id: 1)
  end

  it 'shows user profile picture.' do
    expect(page).to have_selector('img')
  end

  it "shows the user's username." do
    expect(page).to have_selector('h2')
  end

  it 'shows number of posts' do
    expect(page).to have_content('Number of posts:')
  end

  it "shows post's title." do
    expect(page).to have_selector('h3')
  end

  it "shows post's body." do
    expect(page).to have_selector('p')
  end

  it 'I can see the first comments on a post.' do
    expect(page).to have_selector('form')
  end

  it 'I can see how many comments a post has.' do
    expect(page).to have_content('Comments:')
  end

  it 'I can see how many likes a post has.' do
    expect(page).to have_content('Likes:')
  end

  it 'redirects to post show on click' do
    link = page.find(:css, 'div[onclick="window.location=\'/users/1/posts/1\'"]')
    link.click
    expect(page).to have_current_path('/users/1/posts/1')
  end
end

RSpec.describe 'Post show', type: :feature do
  before :each do
    visit user_post_path(user_id: 1, id: 1)
  end
  it "shows post's title." do
    expect(page).to have_selector('h3')
  end

  it 'shows the post author.' do
    expect(page).to have_content('by:')
  end

  it 'shows how many comments it has.' do
    expect(page).to have_content('Comments:')
  end

  it 'shows how many likes it has.' do
    expect(page).to have_content('Likes:')
  end

  it "shows post's body." do
    expect(page).to have_selector('p')
  end

  it 'I can see the username of each commentor.' do
    expect(page).to have_content('Joaquin')
  end

  it 'I can see the comment each commentor left.' do
    expect(page).to have_content('This is my first comment')
  end
end
