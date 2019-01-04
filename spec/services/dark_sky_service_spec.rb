require 'rails_helper'


describe "Dark Sky Service" do

  let(:coordinates) { '39.7392358,-104.990251' }

  before(:each) do
    stub_dark_sky_denver
  end

  it 'gets forecast data' do
    filter  = { target: :forecast, location: coordinates }
    darksky = DarkSkyService.new( filter )
    data    = darksky.target_data

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

end
