require 'rails_helper'

# RSpec.describe "User" do
# RSpec.describe "User", type: :request do
RSpec.describe Api::V1::UsersController, type: :controller do
# RSpec.describe Api::V1::UsersController, type: :request do
# RSpec.describe Api::V1::UsersController do

  before(:each) do
    # post :create, {user: user_stub}
    # post :create, params: {user: user_stub}
    # post api_v1_users_path(params:{user: user_stub}, headers: headers)
    # post api_v1_users_path(user: user_stub)


    # url = api_v1_users_path(user: user_stub)
    # page.driver.submit(:post, url, {})

    headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }
    request.headers.merge!(headers)
    post :create, params: {}, body: user_stub, format: :json, as: :json
  end

  it 'is successful' do
    expect(response).to be_successful
  end

  it 'status 201' do
    expect(response.status).to eq(201)
  end

  it 'makes a user' do
    raw = JSON.parse(response.body, symbolize_names: true)
    data = raw[:data][:attributes]
    expect(data[:api_key]).to  eq(User.last.token)
  end

end


def user_stub
  {
    "email": "whatever@example.com",
    "password": "password",
    "password_confirmation": "password"
  }.to_json
end

# def get_json
#   JSON.parse(response.body, symbolize_names: true)
# end
