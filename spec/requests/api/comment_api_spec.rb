require 'swagger_helper'

RSpec.describe 'api/comment_api', type: :request do
  path 'users/2/posts/11/comment_api' do

    post 'Creates a comment' do
      tags 'comment'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          text: { type: :string },
          authorization_token: { type: :string }
        },
        required: [ 'text', 'authorization_token' ]
      }

      response '201', 'comments created' do
        let(:comment) { { text: 'foo', authorization_token: 'PXVD5a4edDf3tyrx6h-U' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:comment) { { title: 'foo' } }
        run_test!
      end
    end
  end
end
