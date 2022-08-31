require 'rails_helper'

RSpec.describe 'Users_controller_features', type: :feature do
  before(:all) do
    Rails.application.load_seed
  end

  it 'display comment couter in index page' do
    visit '/users'
    expect(page).to have_text('Number of posts:')
  end

  it 'display details of user account' do
    visit '/users/1'
    expect(page).to have_text('Bio:')
  end

  it 'displays users latest post' do
    visit '/users/1'
    expect(page).to have_text('Ruby on Rails')
  end

  it 'has button for displaying more posts' do
    visit '/users/1'
    expect(page).to have_button('See all posts')
  end
end
