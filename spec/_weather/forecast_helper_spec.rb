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

  describe 'Private or Class Methods' do

    it 'private - does not current' do
      h = spy('forecast_helper')
      expect(helper.send(:current)).to_not be_falsey
      expect(h).to have_not_received(:current)
    end

    it 'private - does not today' do
      h = spy('forecast_helper')
      expect(helper.send(:today)).to_not be_falsey
      expect(h).to have_not_received(:today)
    end

    it 'private - does not forecast' do
      h = spy('forecast_helper')
      expect(helper.send(:forecast)).to_not be_falsey
      expect(h).to have_not_received(:forecast)
    end

    it 'private - does not get_forecast' do
      h = spy('forecast_helper')
      expect(helper.send(:get_forecast)).to_not be_falsey
      expect(h).to have_not_received(:get_forecast)
    end

    it 'private - does not get_coordinates' do
      h = spy('forecast_helper')
      expect(helper.send(:get_coordinates)).to_not be_falsey
      expect(h).to have_not_received(:get_coordinates)
    end

    it 'private - does not location' do
      h = spy('forecast_helper')
      expect(helper.send(:location)).to_not be_falsey
      expect(h).to have_not_received(:location)
    end

    it 'private - does not get_location' do
      h = spy('forecast_helper')
      expect(helper.send(:get_location)).to_not be_falsey
      expect(h).to have_not_received(:get_location)
    end
  end

end
