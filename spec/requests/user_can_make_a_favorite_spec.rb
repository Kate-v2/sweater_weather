require 'rails_helper'
require 'api_helper'

RSpec.describe Api::V1::FavoritesController, type: :controller do

  include APIHelper

  let(:body) { { location: 'Denver, CO', api_key: "123abc" } }
  let(:headers) { { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' } }

  it 'failure' do
    user      = create(:user, token: "123abc")
    request.headers.merge!(headers)
    incorrect = body.dup; incorrect[:api_key] = "incorrect"
    json      = incorrect.to_json
    post :create, params: {user: user}, body: json, format: :json, as: :json
    expect(response.status).to eq(401)
  end

  describe 'success' do

    before(:each) do
      @user = create(:user, token: body[:api_key])
      headers = { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' }
      request.headers.merge!(headers)
      json = body.to_json
      post :create, params: {user: @user}, body: json, format: :json, as: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'status 201' do
      expect(response.status).to eq(201)
    end

    # it 'makes a favorite' do
    #   skip('no return render ?')
    #   # raw = get_json
    #   # data = raw[:data][:attributes]
    #   # expect(data[ ]).to  eq( )
    # end

  end



end
