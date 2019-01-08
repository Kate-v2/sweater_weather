require 'rails_helper'


describe "ForecastHelper" do

  let(:location)    { 'Denver,CO' }
  let(:helper)      { ForecastHelper.new(location) }

  before(:each) do
    stub_dark_sky_denver
    stub_geocode_denver
  end

  it 'initializes with location' do
    klass  = helper.class
    expect(klass).to eq(ForecastHelper)
  end

  it 'gets the ForecastEndpoint' do
    ep = helper.forecast_endpoint
    expect(ep.class).to eq(ForecastEndpoint)
  end


end
