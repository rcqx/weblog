require 'rails_helper'

RSpec.describe 'User testing', js: true, type: :system do
  subject!(:author) { User.first }

  before(:each) do
    Rails.application.load_seed
  end

  context 'Post index page stories test' do
    before(:example) do
      visit 'users/1/posts'
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

    it 'checks post title exist' do
      expect(page).to have_selector 'h2', text: 'ror code'
      expect(page).to have_selector 'h2', text: 'Ruby on Rails'
    end
  end

  context 'Post index page stories test' do
    before(:example) do
      visit 'users/1/posts'
    end

    it 'checks post body exist' do
      expect(page).to have_selector 'p', text: 'I started making sugar cane juice'
      expect(page).to have_selector 'p', text: 'I started leaningn RoR recently'
    end

    it 'first comment exists on the page' do
      expect(page).to have_selector 'strong', text: 'Jane Doe'
      expect(page).to have_selector 'p', text: 'Add some lemon to it'
    end

    it 'can see how many comments a post has' do
      expect(page).to have_text('Comments: 1')
      expect(page).to have_text('Comments: 0')
    end

    it 'can see how many comments a post has' do
      expect(page).to have_text('Likes: 1')
      expect(page).to have_text('Likes: 0')
    end

    it 'redirects to post show page when clicking the post' do
      first('.post').click_link('Ruby on Rails')
      sleep(1)
      expect(page).to have_text('Ruby on Rails')
      expect(page).to have_text('Recent post by John Doe')
    end
  end
end
