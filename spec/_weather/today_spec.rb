require 'rails_helper'


describe "Today" do

  let(:file)  { File.read(stub_dark_sky_denver_path) }
  let(:data)  { JSON.parse( file, symbolize_names: true )[:daily][:data][1] }
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

end
