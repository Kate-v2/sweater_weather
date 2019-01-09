require 'rails_helper'
require 'api_helper'

require './spec/fixtures/stub_favorites'


RSpec.describe Api::V1::FavoritesController, type: :controller do

  include APIHelper

  include StubFavorites

  let(:body) { { location: 'Denver, CO', api_key: "123abc" } }
  let(:headers) { { 'CONTENT_TYPE': 'application/json', 'ACCEPT': 'application/json' } }

  let(:user)    { create(:user, token: '123abc') }

  before(:each) do
    stub_favorite_denver
    stub_favorite_golden
    location = Location.create(city: 'Denver', state_short: 'CO', coordinates: '39.7392358,-104.990251' )
    @fav = user.favorites.create(location: location)
    request.headers.merge!(headers)
  end

  it 'failure' do
    incorrect = body.dup; incorrect[:api_key] = "incorrect"
    json      = incorrect.to_json
    delete :destroy, params: {id: user}, body: json, format: :json, as: :json
    expect(response.status).to eq(401)
  end

  describe 'success' do

    before(:each) do
      @json = body.to_json
      stub_favorite_golden
    end

    # Test for when there are no favorites remaining ?

    describe "More than one favorite" do

      before(:each) do
        loc2  = Location.create(city: 'Golden', state_short: 'CO', coordinates: '39.755543,-105.2210997' )
        @fav2 = user.favorites.create(location: loc2)
      end

      it 'is successful' do
        delete :destroy, params: {id: user}, body: @json, format: :json, as: :json
        expect(response).to be_successful
      end

      it 'status 204' do
        delete :destroy, params: {id: user}, body: @json, format: :json, as: :json
        expect(response.status).to eq(204)
      end

      # Do we want to redirect to index or show the removed favorite ?
      # just returning 204
      # it 'deletes a favorite AND returns that deleted favorite' do
      #   expect(Favorite.count).to eq(2)
      #   delete :destroy, params: {id: user}, body: @json, format: :json, as: :json
      #   expect(Favorite.count).to eq(1)
      #   raw  = get_json[:data]
      #   data = raw.first[:attributes]
      #   expect(raw.count).to eq(1)
      #   expect(data[:location]).to            eq("Denver,CO")
      #   expect(data[:current_weather]).to_not be(nil)
      # end
    end

  end

end
