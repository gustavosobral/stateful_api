describe 'Models requests' do
  context 'access' do
    before(:context) do
      user = FactoryGirl.create(:user)
      @auth_headers = user.create_new_auth_token
    end

    it 'allow read actions to regular users' do
      get '/v1/models', params: {}, headers: @auth_headers
      expect(response.status).to eq(200)
    end

    it 'deny for non-admin user' do
      delete '/v1/models/1', params: {}, headers: @auth_headers
      expect(response.status).to eq(401)
    end
  end

  context 'with valid data' do
    before(:context) do
      admin = FactoryGirl.create(:admin)
      @auth_headers = admin.create_new_auth_token
    end

    it 'allow access' do     
      get '/v1/models', params: {}, headers: @auth_headers
      expect(response.status).to eq(200)
    end

    it 'create a new model' do
      model_attrs = FactoryGirl.attributes_for(:model)
      post '/v1/models', { params: { model: model_attrs }, headers: @auth_headers }
      expect(response.status).to eq(200)
      expect_json('name', model_attrs[:name])
    end

    it 'show a existing model' do
      model = FactoryGirl.create(:model)
      get "/v1/models/#{model.id}", params: {}, headers: @auth_headers
      expect(response.status).to eq(200)
      expect_json('name', model.name)
      expect_json_keys([:id, :name, :current_state, :states])
      expect_json_types(states: :array)
    end

    it 'update a existing model' do
      model = FactoryGirl.create(:model)
      put "/v1/models/#{model.id}", params: { model: { name: 'new name' } }, headers: @auth_headers
      expect(response.status).to eq(200)
      expect_json('name', 'new name')
    end

    it 'delete a existing model' do
      model = FactoryGirl.create(:model)
      expect do
        delete "/v1/models/#{model.id}", params: {}, headers: @auth_headers
      end.to change{Model.count}.by(-1)
      expect(response.status).to eq(204)
    end

    it 'walk the current state' do
      model = FactoryGirl.create(:model, current_state: 0)
      3.times { FactoryGirl.create(:state, model: model) }
      
      post "/v1/models/#{model.id}/walk_state", { params: {}, headers: @auth_headers }
      model.reload
      expect(model.current_state).to eq(1)
    end
  end

  context 'with invalid data' do
    before(:context) do
      admin = FactoryGirl.create(:admin)
      @auth_headers = admin.create_new_auth_token
    end

    it "don't create a new model" do
      model_attrs = FactoryGirl.attributes_for(:model, name: nil)
      post '/v1/models', { params: { model: model_attrs }, headers: @auth_headers }
      expect(response.status).to eq(400)
      expect_json('errors.name', ["can't be blank"])
    end

    it "don't show a model" do
      get "/v1/models/100", params: {}, headers: @auth_headers
      expect(response.status).to eq(400)
      expect_json('errors.base', ['record not found'])
    end

    it "don't update a existing model" do
      model = FactoryGirl.create(:model)
      put "/v1/models/#{model.id}", params: { model: { name: nil } }, headers: @auth_headers
      expect(response.status).to eq(400)
      expect_json('errors.name', ["can't be blank"])
    end

    it "don't walk state" do
      model = FactoryGirl.create(:model)
      post "/v1/models/#{model.id}/walk_state", { params: {}, headers: @auth_headers }
      expect(response.status).to eq(400)
      expect_json('errors.base', ['no more states available'])
    end
  end
end
