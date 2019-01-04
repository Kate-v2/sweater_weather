require 'rails_helper'


describe "Currently" do

  # let(:currently) { Currently.new(stub_currently) }
  let(:file)      { File.read(stub_dark_sky_denver_path) }
  let(:data)      { JSON.parse( file, symbolize_names: true )[:currently] }
  let(:currently) { Currently.new(data) }


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

end
