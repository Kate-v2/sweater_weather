require 'rails_helper'
require 'api_helper'

RSpec.describe 'Gifs' do

  include APIHelper

  before(:each) do
    stub_geocode_denver
    stub_dark_sky_denver

    stub_gif_day1_denver
    stub_gif_day2_denver
    stub_gif_day3_denver
    stub_gif_day4_denver
    stub_gif_day5_denver
    stub_gif_day6_denver
    stub_gif_day7_denver
    stub_gif_day8_denver
  end


  it 'It gets a gifs for each day' do
    get api_v1_gifs_path(location: 'Denver,CO')

    expect(response).to be_successful
    json = get_json

    # Fast JSON is a pain....
    data      = json[:data]
    set       = data[:attributes]
    copyright = set[:copyright]
    gifs      = set[:daily_forecast][:data]

    gif       = gifs.first[:attributes]
    time      = gif[:time]
    summary   = gif[:summary]
    url       = gif[:url]

    expect(copyright).to  eq(2019)
    expect(gifs.count).to eq(8)

    expect(time).to    eq(1546498800)
    expect(summary).to eq("Clear throughout the day.")
    expect(url).to     eq("https://giphy.com/gifs/water-ocean-sea-ivcVZnZAEqhs4")
  end

end
