require 'rails_helper'


describe "Hour" do

  let(:file) { File.read(stub_dark_sky_denver_path) }
  let(:data) { JSON.parse( file, symbolize_names: true )[:hourly][:data].first }
  let(:hour)  { Hour.new(data) }


  it 'it initializes from DarkSky sub-hash' do
    expect(hour.class).to eq(Hour)
  end

  it 'has attributes' do
    expect(hour.time).to        eq(data[:time])
    expect(hour.icon).to        eq(data[:icon])
    expect(hour.temperature).to eq(data[:temperature])
  end

end
