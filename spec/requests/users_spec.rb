require 'rails_helper'

RSpec.describe 'Users_controller_requests', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path }
    
    it 'is receiving an Ok response from the server' do
      expect(response).to have_http_status(200)
    end

    it 'renders index template correctly' do 
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    before(:example) { get "/users/4245" }

    it 'is receiving an Ok response from the server' do
      expect(response).to have_http_status(200)
    end

    it 'renders index template correctly' do 
      expect(response).to render_template('show')
    end
  end
end