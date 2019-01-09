require 'rails_helper'


describe "Day" do

  let(:file) { File.read(stub_dark_sky_denver_path) }
  let(:data) { JSON.parse( file, symbolize_names: true )[:daily][:data].first }
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

end
