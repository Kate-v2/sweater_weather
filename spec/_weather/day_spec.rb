require 'rails_helper'


describe "Day" do

  let(:data) { make_json[:daily][:data].first }
  let(:day)  { Day.new(data) }

  it 'it initializes from DarkSky sub-hash' do
    expect(day.class).to eq(Day)
  end

  it 'has attributes' do
    expect(day.time).to               eq(data[:time])
    expect(day.summary).to            eq(data[:summary])
    expect(day.icon).to               eq(data[:icon])
    expect(day.precip_probability).to eq(data[:precipProbability])
    expect(day.precip_type).to        eq(data[:precipType])
    expect(day.low).to                eq(data[:temperatureLow])
    expect(day.high).to               eq(data[:temperatureHigh])
  end

  it 'makes a hash for json' do
    json = day.json
    expect(json.class).to eq(Hash)
    expect(day.time).to               eq(json[:time])
    expect(day.summary).to            eq(json[:summary])
    expect(day.icon).to               eq(json[:icon])
    expect(day.precip_probability).to eq(json[:precip_probability])
    expect(day.precip_type).to        eq(json[:precip_type])
    expect(day.low).to                eq(json[:low])
    expect(day.high).to               eq(json[:high])
  end

end

def make_json
  file = File.read(stub_dark_sky_denver_path)
  JSON.parse( file, symbolize_names: true )
end
