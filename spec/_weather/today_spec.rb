require 'rails_helper'


describe "Today" do

  let(:data)  { make_json[:daily][:data][1] }
  let(:today) { Today.new(data) }


  it 'it initializes from DarkSky sub-hash' do
    expect(today.class).to eq(Today)
  end

  it 'has attributes' do
    expect(today.time).to       eq(data[:time])
    expect(today.summary).to    eq(data[:summary])
    expect(today.icon).to       eq(data[:icon])
    expect(today.low).to        eq(data[:temperatureLow])
    expect(today.high).to       eq(data[:temperatureHigh])
    expect(today.humidity).to   eq(data[:humidity])
    expect(today.visibility).to eq(data[:visibility])
    expect(today.uv_index).to   eq(data[:uvIndex])
  end

  it 'makes a hash for json' do
    json = today.json
    expect(json.class).to       eq(Hash)
    expect(today.time).to       eq(json[:time])
    expect(today.summary).to    eq(json[:summary])
    expect(today.icon).to       eq(json[:icon])
    expect(today.low).to        eq(json[:low])
    expect(today.high).to       eq(json[:high])
    expect(today.humidity).to   eq(json[:humidity])
    expect(today.visibility).to eq(json[:visibility])
    expect(today.uv_index).to   eq(json[:uv_index])
  end

end

def make_json
  file = File.read(stub_dark_sky_denver_path)
  JSON.parse( file, symbolize_names: true )
end
