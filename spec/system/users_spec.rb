require 'rails_helper'

RSpec.describe 'User testing', js: true, type: :system do
  subject!(:author) { User.first }

  before(:all) do
    Rails.application.load_seed
  end

  describe 'GET #index' do
    before(:example) do
      visit "users/1"
    end

    it 'display specific user name in the screen' do
      expect(page).to have_text('John Doe')
    end
  end
end
