require 'rails_helper'


describe "ForecastHelper" do

  let(:helper) { ForecastHelper.new('Denver,CO') }

  before(:each) do
    stub_dark_sky_denver
    stub_geocode_denver
  end

  it 'initializes with location' do
    expect(helper.class).to eq(ForecastHelper)
  end

  it 'gets the ForecastEndpoint' do
    ep = helper.forecast_endpoint
    expect(ep.class).to eq(ForecastEndpoint)
  end

  it 'gets Forecast For Gif' do
    f = helper.forecast_for_gif
    expect(f.class).to eq(Forecast)
  end


end
