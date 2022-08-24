require 'rails_helper'

RSpec.describe 'Users_controller_features', type: :feature do
  
  describe 'GET #index features' do
    it 'display specific user name in the screen' do
      visit '/users'
      expect(page).to have_text('Juan Perez')
    end

    it 'display specific user name in the screen' do
      visit '/users'
      expect(page).to have_text('Jane Doe')
    end

    it 'display comment couter in index page' do
      visit '/users'
      expect(page).to have_text('Number of posts: X')
    end
  end

  describe 'GET #show features' do
    it 'display details of user account' do
      visit '/users/123'
      expect(page).to have_text('Bio:')
    end

    it 'displays users latest post' do
      visit '/users/123'
      expect(page).to have_text('Post 1')
    end

    it 'has button for displaying more posts' do
      visit '/users/123'
      expect(page).to have_button('See all posts')
    end
  end
end