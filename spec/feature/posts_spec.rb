require 'rails_helper'

RSpec.describe 'Posts_controller_features', type: :feature do
  before(:all) do
    Rails.application.load_seed
  end

  describe 'GET #index features' do
    it 'display specific user name in the screen' do
      visit '/users/1/posts'
      expect(page).to have_text('John Doe')
    end

    it 'display specific users last post' do
      visit '/users/1/posts'
      expect(page).to have_text('I started making sugar cane juice')
    end

    it 'displays number of posts on user account' do
      visit '/users/1/posts'
      expect(page).to have_text('Number of posts: 3')
    end
  end

  describe 'GET #show features' do
    it 'display selected post' do
      visit '/users/1/posts/1'
      expect(page).to have_text('Ruby on Rails')
    end

    it 'displays recent comments on selected post' do
      visit '/users/1/posts/1'
      expect(page).to have_text('awesome!')
    end

    it 'displays content of the selected post' do
      visit '/users/1/posts/1'
      expect(page).to have_text('I started leaningn RoR recently')
    end
  end
end
