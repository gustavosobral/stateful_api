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
end
