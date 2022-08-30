require 'rails_helper'

RSpec.describe 'User testing', js: true, type: :system do
  subject!(:author) { User.first }

  before(:each) do
    Rails.application.load_seed
  end

  describe 'User index page stories test' do
    before(:example) do
      visit "users"
    end

    it 'display user names on the screen' do
      expect(page).to have_text('John Doe')
      expect(page).to have_text('Jose Ramon')
      expect(page).to have_text('Jane Doe')
    end

    it 'checks user images exist' do
      imgs = page.all("img[src='https://www.example.com/image']")
      expect(imgs.length).to eq(3)
    end


    it 'can see the number of posts each user has written' do
      expect(page).to have_text('Number of posts: 2')
      expect(page).to have_text('Number of posts: 1')
      expect(page).to have_text('Number of posts: 1')
    end

    it 'redirects to users show page when clicking' do
      first(".postCont").click_link("John Doe")
      expect(page).to have_text('John Doe')
    end

  end
end
