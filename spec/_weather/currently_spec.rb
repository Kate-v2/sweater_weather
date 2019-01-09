require 'rails_helper'


describe "Currently" do

  let(:data)      { make_json }
  let(:currently) { Currently.new( data ) }

  it 'it initializes from DarkSky sub-hash' do
    expect(currently.class).to eq(Currently)
  end

  it 'has attributes' do
    expect(currently.time).to        eq(data[:time])
    expect(currently.summary).to     eq(data[:summary])
    expect(currently.icon).to        eq(data[:icon])
    expect(currently.temperature).to eq(data[:temperature])
    expect(currently.feels_like).to  eq(data[:apparentTemperature])
  end

  it 'makes a hash for json' do
    json = currently.json
    expect(json.class).to eq(Hash)
    expect(json.keys.count).to eq(5)
    expect(currently.time).to        eq(json[:time])
    expect(currently.summary).to     eq(json[:summary])
    expect(currently.icon).to        eq(json[:icon])
    expect(currently.temperature).to eq(json[:temperature])
    expect(currently.feels_like).to  eq(json[:feels_like])
  end

end

def make_json
  file = File.read(stub_dark_sky_denver_path)
  JSON.parse( file, symbolize_names: true )[:currently]
end
