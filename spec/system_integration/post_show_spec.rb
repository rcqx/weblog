require 'rails_helper'

RSpec.describe 'User testing', js: true, type: :system do
  subject!(:author) { User.first }

  before(:each) do
    Rails.application.load_seed
  end

  context 'Post index page stories test' do
    before(:example) do
      visit 'users/1/posts/5'
    end

    it 'Shows the post title on the page' do
      expect(page).to have_selector 'code', text: 'ror code'
    end

    it 'Shows who wrote the post on the page' do
      expect(page).to have_selector 'h2', text: 'Recent post by John Doe'
    end

    it 'checks post body exist' do
      expect(page).to have_selector 'p', text: 'I started making sugar cane juice'
      expect(page).to have_selector 'p', text: 'Add some lemon to it'
    end

    it 'the commenter name exists on the page' do
      expect(page).to have_selector 'strong', text: 'Jane Doe'
      expect(page).to have_selector 'p', text: 'Add some lemon to it'
    end

    it 'the comment exists on the page' do
      expect(page).to have_selector 'strong', text: 'Jane Doe'
      expect(page).to have_selector 'p', text: 'Add some lemon to it'
    end

    it 'can see how many comments the post has' do
      expect(page).to have_text('Comments: 1')
    end

    it 'can see how many comments the post has' do
      expect(page).to have_text('Likes: 1')
    end
  end
end
