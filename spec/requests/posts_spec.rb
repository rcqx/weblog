require 'rails_helper'

RSpec.describe 'Posts_controller_requests', type: :request do
  before(:all) do
    Rails.application.load_seed
  end

  it 'is receiving an Ok response from the server' do
    get users_path
    expect(response).to have_http_status(200)
  end

  it 'renders index template correctly' do
    get users_path
    expect(response).to render_template('index')
  end
end
