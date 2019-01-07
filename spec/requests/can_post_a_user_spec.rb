require 'rails_helper'
require 'api_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

  include APIHelper

  before(:each) do
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
    raw = get_json
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
