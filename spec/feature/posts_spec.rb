require 'rails_helper'

RSpec.describe 'Posts_controller_features', type: :feature do
  describe 'GET #index features' do
    it 'display specific user name in the screen' do
      visit '/users/1/posts'
      expect(page).to have_text('John Doe')
    end

    it 'display specific users last post' do
      visit '/users/1/posts'
      expect(page).to have_text('Post 1')
    end

    it 'displays number of posts on user account' do
      visit '/users/1/posts'
      expect(page).to have_text('Number of posts: X')
    end
  end

  describe 'GET #show features' do
    it 'display selected post' do
      visit '/users/123/posts/1'
      expect(page).to have_text('Post #1 by John Doe')
    end

    it 'displays recent comments on selected post' do
      visit '/users/123/posts/1'
      expect(page).to have_text('Tyler: Nice comment!')
    end

    it 'displays content of the selecte post' do
      visit '/users/123/posts/1'
      expect(page).to have_text('Duis lacinia purus in ultrices ultricies. Phasellus hendrerit sed nunc eu tristique.')
    end
  end
end
