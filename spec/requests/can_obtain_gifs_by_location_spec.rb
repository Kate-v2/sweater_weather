require 'rails_helper'

describe 'Gifs' do

  before(:each) do
    stub_geocode_denver
    stub_dark_sky_denver
    stub_gif_day1_denver
  end


  it '' do
    get api_v1_gifs_path(location: 'Denver,CO')

  end

end
