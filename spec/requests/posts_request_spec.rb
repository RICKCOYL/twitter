require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET index' do
    it 'returns a successful response' do
      get '/posts'
      expect(response).to be_truthy
    end
    it 'assigns @users' do
      post = Post.create(body: 'Test user')
      get '/posts'
      # rubocop:disable  Style/RedundantParentheses
      expect(assigns(:posts)).== ([post])
      # rubocop:enable  Style/RedundantParentheses
    end
  end
end
