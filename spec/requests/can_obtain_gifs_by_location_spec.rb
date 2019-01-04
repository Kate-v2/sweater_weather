require 'rails_helper'

describe 'Gifs' do

  let(:day1_file)  { File.read( stub_gif_day1_denver_path ) }
  let(:day1)       { JSON.parse( file, symbolize_names: true )[:data].first }


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
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json[:copyright]).to eq('2018')

    gifs = json[:data][:forecast]
    expect(gif.count).to eq(8)

    gif  = gifs.first
    expect(gif[:time]).to    eq()
    expect(gif[:summary]).to eq()
    expect(gif[:url]).to eq(day1[:url])
  end

end


#       {
#         time: "1546498800",
#         summary: "Mostly sunny in the morning.",
#         url: "<GIPHY_URL_GOES_HERE>"
#       }
