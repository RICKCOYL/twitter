require 'rails_helper'

RSpec.describe 'Users', type: :request do
  it 'Redirects to sign up page' do
    get '/users/new'
    expect(response).to render_template(:new)

    post '/users', params: { user: { username: 'ricky' } }

    expect(response).to redirect_to(posts_url)
    follow_redirect!

    expect(response).to render_template('posts/index')
  end
end
