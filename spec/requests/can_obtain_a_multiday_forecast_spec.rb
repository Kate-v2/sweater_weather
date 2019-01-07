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
      visit api_v1_forecasts_path(location: location)
    end

    it 'is successful' do
      expect(response).to be_successful
    end

    it 'current' do
      skip
      binding.pry
      json = get_json


    end



  end

end

def page_me
  save_and_open_page
end
