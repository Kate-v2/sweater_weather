require 'rails_helper'
require 'api_helper'

require './spec/fixtures/stub_favorites'

RSpec.describe Api::V1::FavoritesController, type: :controller do

  include APIHelper
  include StubFavorites

  let(:user)    { create(:user, token: '123abc') }
  let(:body)    { { api_key: user.token }.to_json }
  let(:headers) { { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' } }

  before(:each) do
    request.headers.merge!(headers)
  end

  describe "Failure" do

    it 'does not have a valid api_key' do
      json = { api_key: 'abc123' }.to_json
      post :index, params: {}, body: json, format: :json, as: :json
      expect(response.status).to eq(401)
    end

    it 'does not have an api_key' do
      post :index, params: {}, body: nil, format: :json, as: :json
      expect(response.status).to eq(401)
    end

    it 'User does not have favorites' do
      post :index, params: {}, body: body, format: :json, as: :json
      expect(response.status).to eq(401)
    end

  end

  describe "Success" do

    let(:loc1) { Location.create(city: "Denver", state_short: "CO", coordinates: '39.7392358,-104.990251') }
    let(:loc2) { Location.create(city: "Golden", state_short: "CO", coordinates: '39.755543,-105.2210997') }

    before(:each) do
      stub_favorite_denver
      stub_favorite_golden
      user.favorites.create(location: loc1 )
      user.favorites.create(location: loc2 )
      # Get doesn't seem to convey a body
      # get :index, params: {}, body: body, format: :json, as: :json
      post :index, params: {}, body: body, format: :json, as: :json
      # ^^ post is okay: https://stackoverflow.com/questions/7118981/rails-3-get-method-no-request-body
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'status 200' do
      expect(response.status).to eq(200)
    end

    it 'gets all favorites' do
      raw   = get_json
      data  = raw[:data]
      first = data.first[:attributes]
      last  = data.last[:attributes]

      expect(data.count).to eq(2)

      expect(first[:location]).to include("Denver")
      expect(first[:current_weather]).to_not be(nil)

      expect(last[:location]).to include("Golden")
      expect(last[:current_weather]).to_not be(nil)
    end
  end

end
