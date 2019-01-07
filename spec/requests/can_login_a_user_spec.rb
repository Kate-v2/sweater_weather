require 'rails_helper'
require 'api_helper'

RSpec.describe Api::V1::SessionsController, type: :controller do

  include APIHelper

  let(:account) { {
    email:    'email@email.com',
    password: 'password'
  } }

  before(:each) do
    @user = User.create(  email: account[:email],
                          password: account[:password],
                          token: '1234abc' )
    headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }
    request.headers.merge!(headers)
    json = account.to_json
    post :create, params: {}, body: json, format: :json, as: :json
  end

  it 'is successful' do
    expect(response).to be_successful
  end

  it 'status 200' do
    expect(response.status).to eq(200)
  end

  it 'logs in' do
    raw = get_json
    data = raw[:data][:attributes]
    expect(data[:api_key]).to  eq(User.last.token)
  end

end
