require 'rails_helper'

RSpec.describe 'Users_controller_features', js: true, type: :system do
  describe 'GET #index features' do
    it 'display specific user name in the screen' do
      visit ('/users/1')
      sleep(3)
      expect(page).to have_text('John Doe')
    end
  end
end
