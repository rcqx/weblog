require 'rails_helper'

describe 'rendering data correctly in the browser', type: :feature do
  it 'display specific user name in the screen' do
    visit '/users'
    expect(page).to have_text('Juan Perez')
  end
end