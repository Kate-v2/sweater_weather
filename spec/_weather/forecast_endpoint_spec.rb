require 'rails_helper'


describe "ForecastEndpoint" do


  let(:currently)   { double('Currently')   }
  let(:today)       { double('Today') }
  let(:forecast)    { double('Forecast')}
  let(:location)    { double('Location')}
  let(:forecast_ep) { ForecastEndpoint.new( currently, today, forecast, location) }


  it 'it initializes from objects' do
    expect(forecast_ep.class).to eq(ForecastEndpoint)
  end

  it 'has attributes' do
    expect(forecast_ep.current).to  eq(currently)
    expect(forecast_ep.today).to    eq(today)
    expect(forecast_ep.forecast).to eq(forecast)
    expect(forecast_ep.location).to eq(location)
  end

end
