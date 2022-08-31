require 'rails_helper'

RSpec.describe 'User testing', js: true, type: :system do
  subject!(:author) { User.first }

  before(:each) do
    Rails.application.load_seed
  end

  describe 'User index page stories test' do
    before(:example) do
      visit 'users/1'
    end

    it 'display user names on the screen' do
      expect(page).to have_text('John Doe')
    end

    it "checks user's image exist" do
      imgs = page.all("img[src='https://www.example.com/image']")
      expect(imgs.length).to eq(1)
    end

    it 'can see the number of posts the user has written' do
      expect(page).to have_text('Number of posts: 3')
    end

    it "checks user's bio exist" do
      expect(page).to have_selector 'p', text: 'A full stack web developer'
    end

    it 'checks user images exist' do
      imgs = page.all("div[class='post'")
      expect(imgs.length).to eq(3)
    end

    it "There is a button that lets me view all of a user's posts exist" do
      expect(page).to have_button('See all posts')
    end

    it 'redirects to post show page when clicking the post' do
      first('.post').click_link('ror code')
      expect(page).to have_text('ror code')
      expect(page).not_to have_text('Bio')
    end

    it 'redirects to post show page when clicking the post' do
      first('#post-recent').click_button('See all posts')
      expect(page.current_url).not_to eq('users/1/posts')
    end
  end
end
