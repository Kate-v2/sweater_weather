require 'rails_helper'


describe "Dark Sky Service" do

  let(:coordinates) { '39.7392358,-104.990251' }
  let(:filter)      { { target: :forecast, location: coordinates } }
  let(:darksky)     { DarkSkyService.new( filter ) }
  let(:data)        { darksky.target_data }

  before(:each) do
    stub_dark_sky_denver
  end

  it 'gets forecast data' do
    # filter  = { target: :forecast, location: coordinates }
    # darksky = DarkSkyService.new( filter )
    # data    = darksky.target_data

    expect(data.class).to eq(Hash)
    keys = data.keys
    expect(keys).to include(:latitude)
    expect(keys).to include(:longitude)
    expect(keys).to include(:timezone)
    expect(keys).to include(:currently)
    expect(keys).to include(:minutely)
    expect(keys).to include(:hourly)
    expect(keys).to include(:daily)
    expect(keys).to include(:flags)
    expect(keys).to include(:offset)

    expect(data[:timezone]).to eq("America/Denver")
  end

  describe 'Private or Class Methods' do

    it 'private - does not target' do
      s = spy('dark_sky_service')
      expect(darksky.send(:target)).to_not be_falsey
      expect(s).to have_not_received(:target)
    end

    it 'private - does not endpoints' do
      s = spy('dark_sky_service')
      expect(darksky.send(:endpoints)).to_not be_falsey
      expect(s).to have_not_received(:endpoints)
    end

    it 'private - does not key_in_url' do
      s = spy('dark_sky_service')
      expect(darksky.send(:key_in_url)).to_not be_falsey
      expect(s).to have_not_received(:key_in_url)
    end

    it 'private - does not coordinates' do
      s = spy('dark_sky_service')
      expect(darksky.send(:coordinates)).to_not be_falsey
      expect(s).to have_not_received(:coordinates)
    end

    it 'private - does not format_query' do
      s = spy('dark_sky_service')
      expect(darksky.send(:format_query)).to_not be_falsey
      expect(s).to have_not_received(:format_query)
    end

    it 'private - does not get_json' do
      s = spy('dark_sky_service')
      link = "forecast/#{ENV['dark_sky_key']}/39.7392358,-104.990251"
      expect(darksky.send(:get_json, link)).to_not be_falsey
      expect(s).to have_not_received(:get_json, link)
    end

    it 'private - does not forecast_connection' do
      s = spy('dark_sky_service')
      expect(darksky.send(:forecast_connection)).to_not be_falsey
      expect(s).to have_not_received(:forecast_connection)
    end


  end

end
