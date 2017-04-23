describe 'States requests' do
  before(:context) do
    user = FactoryGirl.create(:user)
    @auth_headers = user.create_new_auth_token

    @model = FactoryGirl.create(:model)
    3.times { FactoryGirl.create(:state, model: @model) }
  end

  it 'show states' do
    get "/v1/models/#{@model.id}/states", params: {}, headers: @auth_headers
    expect(response.status).to eq(200)
    expect_json_types(:array)
  end

  it "can't update states as regular user" do
    post "/v1/models/#{@model.id}/states", params: {}, headers: @auth_headers
    expect(response.status).to eq(401)
  end

  context 'as admin' do
    before(:context) do
      admin = FactoryGirl.create(:admin)
      @admin_headers = admin.create_new_auth_token
    end

    it 'update states' do
      states = @model.states.reverse.each_with_index do |state, index|
        state.name  = "#{state.name} ##{index}"
        state.order = index
      end

      post "/v1/models/#{@model.id}/states",
           params: { states: states.map(&:attributes) },
           headers: @admin_headers
      expect(response.status).to eq(200)
      expect_json('0.name', states.first.name)
    end
  end
end
