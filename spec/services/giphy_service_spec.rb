require 'rails_helper'


describe "Giphy Service" do

  # TO DO - Stub -current, -today, -forecast, location

  before(:each) do
    stub_geocode_denver
    stub_dark_sky_denver
    stub_gif_day1_denver
  end

  it 'gets forecast data' do
    target  = { target: :search, term: "Clear throughout the day." }
    giphy   = GiphyService.new( target )
    raw     = giphy.target_data
    data    = raw[:data]

    expect(raw.class).to  eq(Hash)
    expect(data.class).to eq(Array)

    gif  = data.first
    expect(gif.keys).to  include(:url)
    expect(gif[:url]).to eq("https://giphy.com/gifs/water-ocean-sea-ivcVZnZAEqhs4")
  end

end
