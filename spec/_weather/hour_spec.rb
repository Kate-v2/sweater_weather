require 'rails_helper'


describe "Hour" do

  let(:data) { make_json[:hourly][:data].first }
  let(:hour)  { Hour.new(data) }


  it 'it initializes from DarkSky sub-hash' do
    expect(hour.class).to eq(Hour)
  end

  it 'has attributes' do
    expect(hour.time).to        eq(data[:time])
    expect(hour.icon).to        eq(data[:icon])
    expect(hour.temperature).to eq(data[:temperature])
  end

  it 'makes a hash for json' do
    json = hour.json
    expect(json.class).to eq(Hash)
    expect(hour.time).to        eq(json[:time])
    expect(hour.icon).to        eq(json[:icon])
    expect(hour.temperature).to eq(json[:temperature])
  end

end

def make_json
  file = File.read(stub_dark_sky_denver_path)
  JSON.parse( file, symbolize_names: true )
end
