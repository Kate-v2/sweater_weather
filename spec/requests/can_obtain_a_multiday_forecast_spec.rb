require 'rails_helper'
require 'api_helper'


RSpec.describe Api::V1::ForecastsController, type: :controller do

  include APIHelper

  let(:location) { "Denver,CO" }

  before(:each) do
    stub_geocode_denver
    stub_dark_sky_denver
  end

  describe '#INDEX' do

    before(:each) do
      get :index, params: {location: location}, body: nil, format: :json, as: :json
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'current' do
      json = get_json
      binding.pry

      # skip

    end

  end

end

def page_me
  save_and_open_page
end
