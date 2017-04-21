describe 'Authentication' do
  let(:user) { FactoryGirl.create(:user) }

  context 'deny access' do
    it 'without auth data' do
      get '/v1/users/1'
      expect(response.status).to eq(401)
    end

    it 'with invalid credentials' do
      post '/v1/auth/sign_in', params: { email: user.email, password: 'invalid' }
      expect(response.status).to eq(401)
    end
  end

  context 'with valid credentials' do
    it 'do sign in' do
      post '/v1/auth/sign_in', params: { email: user.email, password: user.password }
      expect(response.status).to eq(200)
      expect_json('data.name', user.name)
      expect_json('data.email', user.email)
    end

    it 'access sensitive data' do
      auth_headers = user.create_new_auth_token
      get "/v1/users/#{user.id}", params: {}, headers: auth_headers
      expect(response.status).to eq(200)
      expect_json('name', user.name)
      expect_json('email', user.email)
    end
  end
end
