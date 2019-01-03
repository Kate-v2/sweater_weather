require 'rails_helper'


describe "Can Obtain Forecast Data" do

  let(:location) { "Denver,CO" }

  before(:each) do
    stub_geocode_denver
    visit api_v1_forecasts_path(location: location)
  end

  it 'can get location from browser' do
    skip('Make this a service test')
  end

  it 'can get forcast from location' do
    binding.pry
    skip('Make this a service test')
  end




end
