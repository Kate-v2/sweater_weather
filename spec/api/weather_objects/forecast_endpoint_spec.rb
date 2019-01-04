require 'rails_helper'


describe "ForecastEndpoint" do

  let(:file)        { File.read(stub_dark_sky_denver_path) }
  let(:data)        { JSON.parse( file, symbolize_names: true ) }
  let(:currently)   { Currently.new(data[:currently])   }
  let(:today)       { Today.new(data[:daily][:data][1]) }
  # TODO - mock these tests
  let(:forecast)    { ['mock', 'me', 'forecast']}
  let(:location)    { ['mock', 'me', 'location']}
  let(:forecast_ep) { ForecastEndpoint.new(currently, today, forecast, location) }

  it 'it initializes from objects' do
    skip("I should mock all this")
    expect(forecast_ep.class).to eq(ForecastEndpoint)
  end

  it 'has attributes' do
    expect(forecast_ep.current).to  eq(currently)
    expect(forecast_ep.today).to    eq(today)
    expect(forecast_ep.forecast).to eq(forecast)
    expect(forecast_ep.location).to eq(location)
  end

end
