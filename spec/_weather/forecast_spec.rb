require 'rails_helper'

require 'json'

describe "Forecast" do

  let(:file)     { File.read(stub_dark_sky_denver_path) }
  let(:data)     { JSON.parse( file, symbolize_names: true ) }
  let(:forecast) { Forecast.new(data) }
  let(:hours)    { forecast.hours }
  let(:days)     { forecast.days }


  it 'it initializes from DarkSky json' do
    expect(forecast.class).to eq(Forecast)
  end

  it 'has a collection of hours' do
    expect(hours.class).to       eq(Array)
    expect(hours.count).to       eq(49)
    expect(hours.first.class).to eq(Hour)
  end

  it 'has a collection of days' do
    expect(days.class).to       eq(Array)
    expect(days.count).to       eq(8)
    expect(days.first.class).to eq(Day)
  end



end
